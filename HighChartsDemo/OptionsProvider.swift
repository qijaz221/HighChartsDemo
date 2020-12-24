//
//  OptionProvider.swift
//  HighFit
//
//

import UIKit
import Highcharts

class OptionsProvider {
    
    class func provideOptions(forChartType options: [String: Any],
                              series: [Any], type: String) -> HIOptions {
        var categories = [String]()
        var step: NSNumber?
        
        if type == "day" {
            categories = ["12AM", "", "3AM", "", "6AM", "", "9AM", "", "12PM", "", "3PM", "", "6PM", "", "9PM", "", "12AM"]
            step = 1
        }
        
        if type == "week" {
            categories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            
        }
        
        if type == "month" {
            categories = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
        }
        
        if type == "year" {
            categories = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
            step = 1
        }
        
        if options["chartType"] as? String == "area" {
            let hioptions = HIOptions()
            
            let chart = HIChart()
            chart.backgroundColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 300], stops: [[0, "rgb(102, 153, 161)"], [1, "rgb(128, 135, 232)"]])
            chart.backgroundColor = HIColor(uiColor: .white)
            chart.borderRadius = 6
            chart.type = (options["chartType"] as! String)
            hioptions.chart = chart
            
            let exporting = HIExporting()
            exporting.enabled = (options["exporting"] as! NSNumber)
            hioptions.exporting = exporting
            
            let navigation = HINavigation()
            navigation.buttonOptions = HIButtonOptions()
            navigation.buttonOptions.symbolStroke = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.4)
            navigation.buttonOptions.theme = HITheme()
            navigation.buttonOptions.theme.fill = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            hioptions.navigation = navigation
            
            let plotOptions = HIPlotOptions()
            plotOptions.area = HIArea()
            plotOptions.area.fillColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 1], stops: [[0, "rgba(43,194,129, 0.25)"], [1, "rgba(255,255,255, 0.10)"]])
            hioptions.plotOptions = plotOptions
            
            let credits = HICredits()
            credits.enabled = false
            hioptions.credits = credits
            
            let title = HITitle()
            title.text = (options["title"] as! String)
            title.align = "left"
            title.style = HICSSObject()
            title.style.fontFamily = "Arial"
            title.style.fontSize = "14px"
            title.style.color = "rgba(0, 0, 0, 0.6)"
            title.y = 16
            hioptions.title = title
            
            let subtitle = HISubtitle()
            subtitle.text = (options["subtitle"] as! String)
            if !subtitle.text.isEmpty {
                subtitle.text = subtitle.text + " total"
            }
            subtitle.align = "left"
            subtitle.style = HICSSObject()
            subtitle.style.fontFamily = "Arial"
            subtitle.style.fontSize = "10px"
            subtitle.style.color = "rgba(0, 0, 0, 0.6)"
            subtitle.y = 28
            hioptions.subtitle = subtitle
            
            let tooltip = HITooltip()
            tooltip.headerFormat = ""
            hioptions.tooltip = tooltip
            
            let xaxis = HIXAxis()
            xaxis.tickColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            xaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            xaxis.labels = HILabels()
            xaxis.labels.style = HICSSObject()
            xaxis.labels.style.color = "rgb(0, 0, 0)"
            xaxis.labels.style.textOutline = "10px Arial"
            xaxis.labels.step = step
            xaxis.categories = categories
            hioptions.xAxis = [xaxis]
            
            let yaxis = HIYAxis()
            //43,194,129
            yaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            yaxis.lineWidth = 1
            yaxis.gridLineWidth = 0
            yaxis.labels = HILabels()
            yaxis.labels.style = HICSSObject()
            yaxis.labels.style.color = "rgb(0, 0, 0)"
            yaxis.labels.style.textOutline = "10px Arial"
            yaxis.labels.x = -5
            yaxis.title = HITitle()
            yaxis.title.text = ""
            hioptions.yAxis = [yaxis]
            
            let area = HIArea()
            area.tooltip = HITooltip()
            area.tooltip.headerFormat = ""
            area.tooltip.valueSuffix = " steps"
            area.showInLegend = false
            area.data = series
            //43,194,129
            area.color = HIColor(rgb: 43, green: 194, blue: 129)
            
            let areaMarker = HIMarker()
            areaMarker.symbol = "circle"
            areaMarker.lineColor = "#2BC281"
            areaMarker.lineWidth = 1.5
            areaMarker.fillColor = HIColor(rgb: 255, green: 255, blue: 255)
            areaMarker.enabled = true
            area.marker = areaMarker
            
            area.name = (options["title"] as! String)
            hioptions.series = [area]
            
            return hioptions
        }
        
        
        if options["chartType"] as? String == "column" {
            let hioptions = HIOptions()
            
            let chart = HIChart()
            chart.backgroundColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 300], stops: [[0, "rgb(102, 153, 161)"], [1, "rgb(128, 135, 232)"]])
            chart.backgroundColor = HIColor(uiColor: .white)
            chart.borderRadius = 6
            chart.type = (options["chartType"] as! String)
            hioptions.chart = chart
            
            let exporting = HIExporting()
            exporting.enabled = (options["exporting"] as! NSNumber)
            hioptions.exporting = exporting
            
            let navigation = HINavigation()
            navigation.buttonOptions = HIButtonOptions()
            navigation.buttonOptions.symbolStroke = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.4)
            navigation.buttonOptions.theme = HITheme()
            navigation.buttonOptions.theme.fill = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            hioptions.navigation = navigation
            
            let plotOptions = HIPlotOptions()
            plotOptions.area = HIArea()
            plotOptions.area.fillColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 1], stops: [[0, "rgba(43,194,129, 0.25)"], [1, "rgba(255,255,255, 0.10)"]])
            hioptions.plotOptions = plotOptions
            
            let credits = HICredits()
            credits.enabled = false
            hioptions.credits = credits
            
            let title = HITitle()
            title.text = (options["title"] as! String)
            title.align = "left"
            title.style = HICSSObject()
            title.style.fontFamily = "Arial"
            title.style.fontSize = "14px"
            title.style.color = "rgba(0, 0, 0, 0.6)"
            title.y = 16
            hioptions.title = title
            
            let subtitle = HISubtitle()
            subtitle.text = (options["subtitle"] as! String)
            if !subtitle.text.isEmpty {
                subtitle.text = subtitle.text + " total"
            }
            subtitle.align = "left"
            subtitle.style = HICSSObject()
            subtitle.style.fontFamily = "Arial"
            subtitle.style.fontSize = "10px"
            subtitle.style.color = "rgba(0, 0, 0, 0.6)"
            subtitle.y = 28
            hioptions.subtitle = subtitle
            
            let tooltip = HITooltip()
            tooltip.headerFormat = ""
            hioptions.tooltip = tooltip
            
            let xaxis = HIXAxis()
            xaxis.tickColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            xaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            xaxis.labels = HILabels()
            xaxis.labels.style = HICSSObject()
            xaxis.labels.style.color = "rgb(0, 0, 0)"
            xaxis.labels.style.textOutline = "10px Arial"
            xaxis.labels.step = step
            xaxis.categories = categories
            hioptions.xAxis = [xaxis]
            
            let yaxis = HIYAxis()
            //43,194,129
            yaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            yaxis.lineWidth = 1
            yaxis.gridLineWidth = 0
            yaxis.labels = HILabels()
            yaxis.labels.style = HICSSObject()
            yaxis.labels.style.color = "rgb(0, 0, 0)"
            yaxis.labels.style.textOutline = "10px Arial"
            yaxis.labels.x = -5
            yaxis.title = HITitle()
            yaxis.title.text = ""
            hioptions.yAxis = [yaxis]
            
            let area = HIArea()
            area.tooltip = HITooltip()
            area.tooltip.headerFormat = ""
            area.tooltip.valueSuffix = " steps"
            area.showInLegend = false
            area.data = series
            //43,194,129
            area.color = HIColor(rgb: 43, green: 194, blue: 129)
            
            let areaMarker = HIMarker()
            areaMarker.symbol = "circle"
            areaMarker.lineColor = "#2BC281"
            areaMarker.lineWidth = 1.5
            areaMarker.radius = 6
            areaMarker.fillColor = HIColor(rgb: 255, green: 255, blue: 255)
            areaMarker.enabled = true
            area.marker = areaMarker
            
            area.name = (options["title"] as! String)
            hioptions.series = [area]
            
            return hioptions
        }
        
        if options["chartType"] as? String == "spline" {
            let hioptions = HIOptions()
            
            let chart = HIChart()
            chart.backgroundColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 300], stops: [[0, "rgb(102, 153, 161)"], [1, "rgb(128, 135, 232)"]])
            chart.backgroundColor = HIColor(uiColor: .white)
            chart.borderRadius = 6
            chart.type = (options["chartType"] as! String)
            hioptions.chart = chart
            
            let exporting = HIExporting()
            exporting.enabled = (options["exporting"] as! NSNumber)
            hioptions.exporting = exporting
            
            let navigation = HINavigation()
            navigation.buttonOptions = HIButtonOptions()
            navigation.buttonOptions.symbolStroke = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.4)
            navigation.buttonOptions.theme = HITheme()
            navigation.buttonOptions.theme.fill = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            hioptions.navigation = navigation
            
            let plotOptions = HIPlotOptions()
            plotOptions.area = HIArea()
            plotOptions.area.fillColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 1], stops: [[0, "rgba(43,194,129, 0.25)"], [1, "rgba(255,255,255, 0.10)"]])
            hioptions.plotOptions = plotOptions
            
            let credits = HICredits()
            credits.enabled = false
            hioptions.credits = credits
            
            let title = HITitle()
            title.text = (options["title"] as! String)
            title.align = "left"
            title.style = HICSSObject()
            title.style.fontFamily = "Arial"
            title.style.fontSize = "14px"
            title.style.color = "rgba(0, 0, 0, 0.6)"
            title.y = 16
            hioptions.title = title
            
            let subtitle = HISubtitle()
            subtitle.text = (options["subtitle"] as! String)
            if !subtitle.text.isEmpty {
                subtitle.text = subtitle.text + " total"
            }
            subtitle.align = "left"
            subtitle.style = HICSSObject()
            subtitle.style.fontFamily = "Arial"
            subtitle.style.fontSize = "10px"
            subtitle.style.color = "rgba(0, 0, 0, 0.6)"
            subtitle.y = 28
            hioptions.subtitle = subtitle
            
            let tooltip = HITooltip()
            tooltip.headerFormat = ""
            hioptions.tooltip = tooltip
            
            let xaxis = HIXAxis()
            xaxis.tickColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            xaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            xaxis.labels = HILabels()
            xaxis.labels.style = HICSSObject()
            xaxis.labels.style.color = "rgb(0, 0, 0)"
            xaxis.labels.style.textOutline = "10px Arial"
            xaxis.labels.step = step
            xaxis.categories = categories
            hioptions.xAxis = [xaxis]
            
            let yaxis = HIYAxis()
            //43,194,129
            yaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
            yaxis.lineWidth = 1
            yaxis.gridLineWidth = 0
            yaxis.labels = HILabels()
            yaxis.labels.style = HICSSObject()
            yaxis.labels.style.color = "rgb(0, 0, 0)"
            yaxis.labels.style.textOutline = "10px Arial"
            yaxis.labels.x = -5
            yaxis.title = HITitle()
            yaxis.title.text = ""
            hioptions.yAxis = [yaxis]
            
            let area = HIArea()
            area.tooltip = HITooltip()
            area.tooltip.headerFormat = ""
            area.tooltip.valueSuffix = " steps"
            area.showInLegend = false
            area.data = series
            //43,194,129
            area.color = HIColor(rgb: 43, green: 194, blue: 129)
            
            let areaMarker = HIMarker()
            areaMarker.symbol = "circle"
            areaMarker.lineColor = "#2BC281"
            areaMarker.lineWidth = 1.5
            areaMarker.fillColor = HIColor(rgb: 255, green: 255, blue: 255)
            areaMarker.enabled = true
            //area.marker = areaMarker
            
            area.name = (options["title"] as! String)
            hioptions.series = [area]
            
            return hioptions
        }
        
        return HIOptions()
    }
}
