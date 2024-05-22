import UIKit

protocol MainViewDelegate: AnyObject {

}
class MainView: UIView {
    private lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Main page"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 18, weight: .heavy, width: .condensed)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var eventsTableView: UITableView = {
        let table = UITableView()
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        table.backgroundColor = .white
        table.rowHeight = 100
        table.showsVerticalScrollIndicator = false

        return table
    }()
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension MainView {
    func configureView() {
        addSubview(pageNameLabel)
        addSubview(eventsTableView)
        addSubview(activityIndicatorView)

        pageNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(24)
        }
        eventsTableView.snp.makeConstraints { make in
            make.top.equalTo(pageNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalToSuperview().offset(-100)
        }
        activityIndicatorView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

}
extension MainView {

    func setupDataSource(_ dataSource: UITableViewDataSource) {
        self.eventsTableView.dataSource = dataSource
    }

    func setupDelegate(_ delegate: UITableViewDelegate) {
        self.eventsTableView.delegate = delegate
    }

    func reloadData() {
        eventsTableView.reloadData()
    }
    
}
extension MainView {
    func startAnimatingActivityIndicator() {
        activityIndicatorView.startAnimating()
    }
    func stopAnimatingActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
}
