import UIKit

class CommentsViewController: UIViewController {

    private let contentView: CommentsView = .init()
    private let viewModel: CommentsModel

    init(viewModel: CommentsModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

    }

}
