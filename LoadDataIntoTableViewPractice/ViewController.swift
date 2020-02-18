import UIKit

class ViewController: UIViewController {
    
    var fibNumbers = [Double]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "fibCell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadNextTwentyNumbers()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func loadNextTwentyNumbers() {
        for i in fibNumbers.endIndex..<(fibNumbers.endIndex + 20) {
            fibNumbers.append(FibonacciNumber.fib(n: i))
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == fibNumbers.count - 1 {
            loadNextTwentyNumbers()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fibCell", for: indexPath)
        cell.textLabel?.text = String(format: "%g", fibNumbers[indexPath.row])
        return cell
    }
}

