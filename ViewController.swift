//
//  ViewController.swift
//  1223
//
//  Created by Ivan Ermak on 3/26/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit
import CorePlot   

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var graphsView: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var circleGraph: CPTGraphHostingView!
    @IBOutlet weak var graphView: CPTGraphHostingView!
    @IBAction func menuShown(_ sender: Any){
        
        menuView.isHidden = !menuView.isHidden
        
    }
    @IBAction func changeView(_ sender: Any) {
        graphsView.isHidden = !graphsView.isHidden
        circleGraph.isHidden = !circleGraph.isHidden
        if (!circleGraph
            .isHidden){
            initPie()
        }
        else {
            initGraph()
        }
        
    }
    var percents: [Double] = []
    var value = 0.0
    var array = ["ETH", "XRP", "MKR", "JHT"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        menuView.isHidden = true
        graphsView.isHidden = true
        initPie()
       // let req = web3swift.sign(address: <#T##GethAddress#>, encodedFunctionData: <#T##Data#>, nonce: <#T##Int64#>, gasLimit: <#T##GethBigInt#>, gasPrice: <#T##GethBigInt#>)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initPie() {
        configurePieHostView()
        configurePie()
        configurePieChart()
        configurePieLegend()
    }
    func initGraph() {
       /* configureGraphHostView()
        configureGraph()
        configureGraphChart()
        configureGraphLegend()
 */
    }

    
    
}
extension ViewController: CPTPieChartDataSource, CPTPieChartDelegate {
    
    func numberOfRecords(for plot: CPTPlot) -> UInt {
        return 4
    }
    
    func number(for plot: CPTPlot, field fieldEnum: UInt, record idx: UInt) -> Any? {
        let str = Double.random(in: 300...360) / (1.0 + Double(idx))
        value += str
        percents.append(str)
        return str
    }
    
    func dataLabel(for plot: CPTPlot, record idx: UInt) -> CPTLayer? {
        debugPrint(idx)
        let index = Int(idx)
        var str = ""
        let id = array[index]
        str = id
       
        let label = CPTTextLayer(text:"\(str)")
        
        if let textStyle = label.textStyle?.mutableCopy() as? CPTMutableTextStyle {
            textStyle.color = .black()
            
            label.textStyle = textStyle
        }
        
        return label
    }
    
    func sliceFill(for pieChart: CPTPieChart, record idx: UInt) -> CPTFill? {
        switch idx {
        case 0:   return CPTFill(color: CPTColor(componentRed:0.92, green:0.28, blue:0.25, alpha:1.00))
        case 1:   return CPTFill(color: CPTColor(componentRed:0.06, green:0.80, blue:0.48, alpha:1.00))
        case 2:   return CPTFill(color: CPTColor(componentRed:0.22, green:0.33, blue:0.49, alpha:1.00))
        default:  return nil
        }
    }
    
    func legendTitle(for pieChart: CPTPieChart, record idx: UInt) -> String? {
        var legendString = array[Int(idx)]
        legendString.append(", ")
        let res = (percents[Int(idx)] / value) * 100
        let result = Double(round(100*res)/100)
        
        legendString.append(String(result))
        legendString.append("%")
        return legendString
    }
}

//Mark: Pie configuration

extension ViewController {
    
    func configurePieHostView() {
        circleGraph.allowPinchScaling = false
        //circleGraph.backgroundColor = 
    }
    
    func configurePie() {
        let graph = CPTXYGraph(frame: circleGraph.bounds)
        circleGraph.hostedGraph = graph
        graph.paddingLeft = 0.0
        graph.paddingTop = 0.0
        graph.paddingRight = 0.0
        graph.paddingBottom = 0.0
        graph.axisSet = nil
        
        // 2 - Create text style
        let textStyle: CPTMutableTextStyle = CPTMutableTextStyle()
        textStyle.color = CPTColor.black()
        textStyle.fontName = "HelveticaNeue-Bold"
        textStyle.fontSize = 16.0
        textStyle.textAlignment = .center
        
        // 3 - Set graph title and text style
        graph.title = ""
        graph.titleTextStyle = textStyle
        graph.titlePlotAreaFrameAnchor = CPTRectAnchor.top
    }
    
    func configurePieChart() {
        let graph = circleGraph.hostedGraph!
        
        // 2 - Create the chart
        let pieChart = CPTPieChart()
        pieChart.delegate = self
        pieChart.dataSource = self
        pieChart.pieRadius = (min(circleGraph.bounds.size.width, circleGraph.bounds.size.height) * 0.7) / 2
        pieChart.identifier = NSString(string: graph.title!)
        pieChart.startAngle = CGFloat(Double.pi/4)
        pieChart.sliceDirection = .clockwise
        pieChart.labelOffset = -0.6 * pieChart.pieRadius
        
        // 3 - Configure border style
        let borderStyle = CPTMutableLineStyle()
        borderStyle.lineColor = CPTColor.white()
        borderStyle.lineWidth = 2.0
        pieChart.borderLineStyle = borderStyle
        
        
        // 4 - Configure text style
        let textStyle = CPTMutableTextStyle()
        textStyle.color = CPTColor.black()
        textStyle.textAlignment = .center
        pieChart.labelTextStyle = textStyle
        // 5 - Add chart to graph
        graph.add(pieChart)
    }
    
    func configurePieLegend() {
        // 1 - Get graph instance
        guard let graph = circleGraph.hostedGraph else { return }
        
        // 2 - Create legend
        let theLegend = CPTLegend(graph: graph)
        
        // 3 - Configure legend
        theLegend.numberOfColumns = 1
        theLegend.fill = CPTFill(color: CPTColor.white())
        let textStyle = CPTMutableTextStyle()
        textStyle.fontSize = 18
        theLegend.textStyle = textStyle
        
        // 4 - Add legend to graph
        graph.legend = theLegend
        if view.bounds.width > view.bounds.height {
            graph.legendAnchor = .right
            graph.legendDisplacement = CGPoint(x: -20, y: 20.0)
            
        } else {
            graph.legendAnchor = .bottomRight
            graph.legendDisplacement = CGPoint(x: -15.0, y: 20.0)
        }
    }
   
}

//Mark: Graph configuration
extension ViewController {
    
    func configureGraphHostView() {
        graphView.allowPinchScaling = false
    }
    
    func configureGraph() {
        let graph = CPTXYGraph(frame: graphView.bounds)
        graphView.hostedGraph = graph
        graph.paddingLeft = 0.0
        graph.paddingTop = 0.0
        graph.paddingRight = 0.0
        graph.paddingBottom = 0.0
        graph.newAxisSet()
        
        // 2 - Create text style
        let textStyle: CPTMutableTextStyle = CPTMutableTextStyle()
        textStyle.color = CPTColor.black()
        textStyle.fontName = "HelveticaNeue-Bold"
        textStyle.fontSize = 16.0
        textStyle.textAlignment = .center
        
        // 3 - Set graph title and text style
        graph.title = "This is graph title"
        graph.titleTextStyle = textStyle
        graph.titlePlotAreaFrameAnchor = CPTRectAnchor.top
    }
    
    func configureGraphChart() {
        let graph = circleGraph.hostedGraph!
        
        // 2 - Create the chart
        let graphChart = CPTRangePlot()
        graphChart.delegate = self
        graphChart.dataSource = self
        graphChart.barWidth = 2.0
        graphChart.gapWidth = 1.0
        graphChart.gapHeight = 1.0
       /* graphChart
        graphChart.pieRadius = (min(circleGraph.bounds.size.width, circleGraph.bounds.size.height) * 0.7) / 2
        graphChart.identifier = NSString(string: graph.title!)
        graphChart.
        */
        // 3 - Configure border style
        let borderStyle = CPTMutableLineStyle()
        borderStyle.lineColor = CPTColor.black()
        borderStyle.lineWidth = 2.0
        graphChart.areaBorderLineStyle = borderStyle
        
        // 4 - Configure text style
        let textStyle = CPTMutableTextStyle()
        textStyle.color = CPTColor.black()
        textStyle.textAlignment = .center
        graphChart.labelTextStyle = textStyle
        
        // 5 - Add chart to graph
        graph.add(graphChart)
    }
    
    func configureGraphLegend() {
    }
}

