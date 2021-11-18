//
//  OrganisationSalesTabVC.swift
//  SocialHunter
//
//  Created by Apple on 29/10/21.
//

import UIKit
import Charts

class OrganisationSalesTabVC: UIViewController, ChartViewDelegate {

    @IBOutlet var chartView: UIView!
    var lineChart: LineChart!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
        // Do any additional setup after loading the view.
    }
    func setupChart()
    {
        
        
//        label.text = "..."
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = NSTextAlignment.center
//        self.view.addSubview(label)
//        views["label"] = label
       // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: /views))
       // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        // simple arrays
        let data: [CGFloat] = [30, 22, 15, 50]
        let data2: [CGFloat] = [9.0, 3.0, 5.0, 13.0]
        let data3: [CGFloat] = [3, 5, 10, 40]
        // simple line with custom x axis labels
        let xLabels: [String] = ["2017", "2018", "2019", "2020"]
        let yLabels: [String] = ["", "10", "20", "30","40","50"]
        lineChart = LineChart()
        lineChart.frame = CGRect(x: 40, y: 30, width: self.view.frame.width - 80, height: 300)
        lineChart.animation.enabled = false
        lineChart.area = false
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 4
        lineChart.y.grid.count = 5
        
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.y.labels.values = yLabels
        
        lineChart.addLine(data)
        lineChart.addLine(data2)
        lineChart.addLine(data3)
        //lineChart.translatesAutoresizingMaskIntoConstraints = false
       // lineChart.delegate = self
        self.view.addSubview(lineChart)
       // views["chart"] = lineChart
       // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
       // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
