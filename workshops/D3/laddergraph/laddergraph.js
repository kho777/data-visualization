/**
 * Reusable, responsive ladder chart, that can have two switchable left axes.
 * For D3.js v4.
 *
 * In use:
 *
 * <div class="js-chart" style="max-width: 400px; height: 500px;"></div>
 *
 * <script>
 *   var data = [
 *    {
 *      'Service': 5,
 *      'Speed': 7,
 *      'Overall': 88,
 *      'Name': 'Bob'
 *      'Age': 34
 *    },
 *    ...
 *  ];
 *
 *  var laddergraph = charts.laddergraph()
 *                            .leftKey1('Service')
 *                            .leftKey2('Speed')
 *                            .rightKey('Overall')
 *                            .tooltipFormat(function(d) {
 *                              return '<b>' + d['Name'] + '</b> ' + d['Age'];
 *                            });
 *
 *  d3.select('js-chart')
 *      .datum(data)
 *      .call(laddergraph);
 *
 * </script>
 *
 *
 * If you want one of the left-hand axes to be the other way up (i.e. have
 * lower values at the top) then change the default orientation to 'inverted'.
 * e.g.:
 *
 *  var laddergraph = charts.laddergraph()
 *                            .leftKey1('Service')
 *                            .leftKey1Orientation('inverted')
 *                            .leftKey2('Speed')
 *                            .rightKey('Overall');
 */
;(function() {
  'use strict';
  window.charts = window.charts || {};

  charts.laddergraph = function module() {

    // Default values that can be overridden:
    var leftKey1 = '',
        leftKey1Orientation = 'normal',
        leftKey2 = '',
        leftKey2Orientation = 'normal',
        rightKey = '',
        tooltipFormat = function(d, i) {
          return i;
        };

    function chart(selection) {

      var margin = {top: 45, bottom: 10, left: 0, right: 0};

      var tooltip = d3.select('body')
                      .append('div')
                      .classed('tooltip', true)
                      .style('position', 'absolute')
                      .style('visibility', 'hidden');

      selection.each(function(data) {

        var container = d3.select(this);

        var svg = container.append('svg');

        // Initial defaults for left y-axis:
        var leftKey = leftKey1;
        var leftKeyOrientation = leftKey1Orientation;

        var yScaleLeft = d3.scaleLinear();

        setLeftAxisDomain();

        var yScaleRight = d3.scaleLinear()
                            .domain([0, 10]);

        var yAxisLeft = svg.append('g')
                            .classed('axis axis-l', true);

        var yAxisRight = svg.append('g')
                            .classed('axis axis-r', true);

        var yAxisLeftLabel = svg.append('text')
                              .classed('axis-label axis-label-l', true);

        var yAxisRightLabel = svg.append('text')
                              .classed('axis-label axis-label-r', true);

        var yAxisLeftSwitcher = svg.append('text')
                                .classed('axis-switcher', true)
                                .text('Change')
                                .on('click', switchLeftAxis);

        // Need to be in a scope the functions below can access:
        var totalW;
        var totalH;
        var chartW;
        var chartH;

        render();

        window.addEventListener('resize', render);

        function render() {
          setOuterDimensions();
          renderStructure();
          renderAxes();
          setInnerDimensions();
          renderLines();
        };

        /**
         * Work out how big the entire chart area is.
         */
        function setOuterDimensions() {
          var rect = container.node().getBoundingClientRect();
          // Total width and height:
          totalW = parseInt(rect.width, 10);
          totalH = parseInt(rect.height, 10);
        };

        /**
         * Draw chart to correct dimensions.
         */
        function renderStructure() {
          svg.transition().attr('width', totalW)
                          .attr('height', totalH);
        };

        /**
         * Draw the two y axes and ticks.
         * AND set margin.left and margin.right to allow for how wide the tick
         * labels are.
         */
        function renderAxes() {
          renderLeftAxis();
          renderRightAxis();
        };

        function renderLeftAxis() {
          yScaleLeft.range([totalH - margin.bottom, margin.top]);

          yAxisLeft
              .call(d3.axisLeft(yScaleLeft));

          // Find widest left axis tick label and base margin.left on that.

          // Because we have two left axes we need to do this for both.
          var maxw = 0;

          // First, for the left axis that is currently displayed.
          yAxisLeft.selectAll('text').each(function() {
            if(this.getBBox().width > maxw) maxw = this.getBBox().width;
          });

          // Now to get it for whatever isn't the current left axis.
          // Make a temporary left axis using the other key:
          var otherLeftKey = leftKey == leftKey1 ? leftKey2 : leftKey1;
          var otherYScaleLeft = d3.scaleLinear();
          // Set its domain like setLeftAxisDomain() does:
          otherYScaleLeft.domain(
                  [0, d3.max(data, function(d) { return d[otherLeftKey]; })]
              );
          // Create the temporary left axis element:
          var otherYAxisLeft = svg.append('g')
                                  .classed('axis axis-l', true).
                                  style('visibility', 'hidden');
          otherYAxisLeft.call(d3.axisLeft(otherYScaleLeft));
          // See if any of its tick values are bigger than what we have already:
          otherYAxisLeft.selectAll('text').each(function() {
            if(this.getBBox().width > maxw) maxw = this.getBBox().width;
          });

          margin.left = maxw + 10;

          yAxisLeft.attr("transform", "translate(" + margin.left + ",0)");

          yAxisLeftLabel
            .attr('dx', 0)
            .attr('dy', 15)
            .text(leftKey);

          // The 'Change' link.
          yAxisLeftSwitcher
            .attr('dx', 0)
            .attr('dy', 30);
        };

        function renderRightAxis() {
          yScaleRight.range([totalH - margin.bottom, margin.top])

          yAxisRight
              .call(d3.axisRight(yScaleRight).ticks(10));

          // Find widest right axis tick label and base margin.right on that.
          var maxw = 0;

          yAxisRight.selectAll('text').each(function() {
            if(this.getBBox().width > maxw) maxw = this.getBBox().width;
          });

          margin.right = maxw + 10;

          yAxisRight.attr(
                  "transform", "translate(" + (totalW - margin.right) + ",0)");

          yAxisRightLabel
            .attr('dx', totalW)
            .attr('dy', 30)
            .attr('text-anchor', 'end')
            .text(rightKey);
        };

        /**
         * Set dimensions of inner chart area, between y axes.
         * Needs the left and right margins to have been set.
         */
        function setInnerDimensions() {
          // Area of the chart itself:
          chartW = totalW - margin.left - margin.right;
          chartH = totalH - margin.top - margin.bottom;
        };

        /**
         * Draw the lines between the axes.
         */
        function renderLines() {
          var lines = svg.selectAll('.js-line')
                          .data(data);

          // Update
          lines.transition()
              .attr('x2', chartW + margin.left)
              .attr('y1', function(d) { return yScaleLeft(d[leftKey]); })
              .attr('y2', function(d) { return yScaleRight(d[rightKey]); });

          // Enter
          lines.enter()
            .append('line')
              .attr('x1', margin.left)
              .attr('x2', chartW + margin.left)
              .attr('y1', function(d) { return yScaleLeft(d[leftKey]); })
              .attr('y2', function(d) { return yScaleRight(d[rightKey]); })
              .style('stroke', '#000')
              .classed('js-line line', true)
                          .on('mouseover', function(d) {
                            tooltip.html( tooltipFormat(d) );
                            tooltip.style('visibility', 'visible');
                          })
                          .on('mousemove', function(d) {
                            tooltip
                              .style('top', (event.pageY-10)+'px')
                              .style('left',(event.pageX+15)+'px');
                          })
                          .on('mouseout', function(d) {
                            tooltip.style('visibility', 'hidden');
                          })
                          .on('click', function(d) {
                            // When clicked, toggle the .line-selected class off
                            // or on.
                            d3.select(this)
                                .classed(
                                  'line-selected',
                                  d3.select(this)
                                    .classed('line-selected') ? false : true);
                          });

          // Remove
          lines.exit().remove();
        };

        /**
         * When the 'change' link is clicked, change the left y-axis,
         * and re-render the chart.
         */
        function switchLeftAxis() {
          if (leftKey === leftKey1) {
            leftKey = leftKey2;
            leftKeyOrientation = leftKey2Orientation;
          } else {
            leftKey = leftKey1;
            leftKeyOrientation = leftKey1Orientation;
          };

          setLeftAxisDomain();

          render();
        };

        /**
         * Set the domain of whatever the current left y-axis is.
         */
        function setLeftAxisDomain() {
          var leftMax = d3.max(data, function(d) { return d[leftKey]; });
          if (leftKeyOrientation === 'inverted') {
            yScaleLeft.domain([leftMax, 0]);
          } else {
            yScaleLeft.domain([0, leftMax]);
          };
        };

      });
    }; // end chart()

    chart.leftKey1 = function(value) {
      if (!arguments.length) {
        return leftKey1;
      };
      leftKey1 = value;
      return this;
    };
    chart.leftKey2 = function(value) {
      if (!arguments.length) {
        return leftKey2;
      };
      leftKey2 = value;
      return this;
    };
    chart.leftKey1Orientation = function(value) {
      if (!arguments.length) {
        return leftKey1Orientation;
      };
      leftKey1Orientation = value;
      return this;
    };
    chart.leftKey2Orientation = function(value) {
      if (!arguments.length) {
        return leftKey2Orientation;
      };
      leftKey2Orientation = value;
      return this;
    };
    chart.rightKey = function(value) {
      if (!arguments.length) {
        return rightKey;
      };
      rightKey = value;
      return this;
    };
    chart.tooltipFormat = function(value) {
      if (!arguments.length) {
        return tooltipFormat;
      };
      tooltipFormat = value;
      return this;
    };

    return chart;
  };

}());
