//
//  ViewController.swift
//  HighChartsDemo
//
//  Created by ZaQ on 22/12/2020.
//

import UIKit
import Highcharts

class ViewController: UIViewController {
    
    
    @IBOutlet weak var chartView: HIChartView!
    @IBOutlet weak var chartView2: HIChartView!
    @IBOutlet weak var chartView3: HIChartView!
    
    var sources: [[String:Any]]!
    var data: [Any]!
    var dataName: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSourcesAndData()
        self.dataName = "day"
        // Do any additional setup after loading the view.
        for index in 0...2 {
            var options = self.sources[index]
            chartView.backgroundColor = UIColor.clear
            //chartView.delegate = self
            
            let seriesData = self.data[index] as! [String: Any]
            let series = seriesData[self.dataName] as! [Int]
            var sum = 0
            for number in series {
                sum += number
            }
            
            options["subtitle"] = "\(sum) \(options["unit"]!)"
            
            if index == 0 {
                chartView.options = OptionsProvider.provideOptions(forChartType: options, series: series, type: "day")
            } else if index == 1 {
                chartView2.options = OptionsProvider.provideOptions(forChartType: options, series: series, type: "day")
            } else if index == 2 {
                chartView3.options = OptionsProvider.provideOptions(forChartType: options, series: series, type: "day")
            }
            
        }
        
        /*var options = self.sources[0]
        chartView.backgroundColor = UIColor.clear
        //chartView.delegate = self
        
        let seriesData = self.data[0] as! [String: Any]
        let series = seriesData[self.dataName] as! [Int]
        var sum = 0
        for number in series {
            sum += number
        }
        
        options["subtitle"] = "\(sum) \(options["unit"]!)"
        
        chartView.options = OptionsProvider.provideOptions(forChartType: options, series: series, type: "day")*/
    }


    
    private func loadSourcesAndData() {
        self.data = [Any]()
        
        self.sources = (UserDefaults.standard.value(forKey: "sources") as! [[String: Any]])
        
        var tmpData = [Any]()
        for source in self.sources {
            
            do {
                if let sourceName = source["source"] as? String,
                    let sourcePath = Bundle.main.path(forResource: sourceName, ofType: "json"),
                    let sourceData = try? Data(contentsOf: URL(fileURLWithPath: sourcePath)),
                    let sourceJson = try JSONSerialization.jsonObject(with: sourceData) as? [String: Any] {
                    tmpData.append(sourceJson)
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        }
        self.data = tmpData
    }
}

