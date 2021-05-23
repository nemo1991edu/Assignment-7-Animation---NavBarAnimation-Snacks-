
//

import UIKit

class SnacksViewController: UIViewController {
    
    let cellId = "cell"
    var width: CGFloat?
    var navBarView: UIView!
    var tableView = UITableView()
    var isOpen = false
    
    var snacks: [String] = []
    
    let snacksTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Snacks"
        lbl.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        lbl.textAlignment = .center
        lbl.isHidden = false
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let addSnacksTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add Snacks"
        lbl.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        lbl.textAlignment = .center
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let addButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 330, y: 45, width: 40, height: 40))
        button.setTitle("＋", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.addTarget(self, action: #selector(openSnacks(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var hStackViewSnacks: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .equalCentering
        sv.alignment = .center
        sv.spacing = 20
        sv.isHidden = true
        return sv
    }()
    
    var vContainerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        return sv
    }()
    
    let burgerButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ramen"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(snackSelected(_:)), for: .touchUpInside)
        return btn
    }()
    
    let friesButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "popsicle"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(snackSelected(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    let steakButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "poptarts"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(snackSelected(_:)), for: .touchUpInside)
        return btn
    }()
    
    let eggButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "pizzapockets"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(snackSelected(_:)), for: .touchUpInside)
        return btn
    }()
    
    let chickenButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "oreos"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(snackSelected(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    @objc func snackSelected(_ sender: UIButton) {
        guard let image = sender.currentImage else { return }
        //animate button when tapped
        UIView.animate(withDuration: 0.15) {
            sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        } completion: { (_) in
            UIView.animate(withDuration: 0.15) {
                sender.transform = CGAffineTransform.identity
            }
        }
        var selectedSnack: String
        
        switch image {
            case UIImage(named: "poptarts"):
                selectedSnack = "poptarts"
            case UIImage(named: "popsicle"):
                selectedSnack = "popsicle"
            case UIImage(named: "ramen"):
                selectedSnack = "ramen"
            case UIImage(named: "pizzapockets"):
                selectedSnack = "pizzapockets"
            case UIImage(named: "oreos"):
                selectedSnack = "oreos"
            default:
                fatalError()
        }
        snacks.insert(selectedSnack, at: 0)
        tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .top)
    }
    
    func setupNavigationBar() {
        
        tableView.register(SnackTableViewCell.self, forCellReuseIdentifier: cellId)
        width = view.frame.size.width
        navBarView = UIView(frame: CGRect(x: 0, y: 0, width: width!, height: 90))
        navBarView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

        let hStackView = UIStackView(arrangedSubviews: [snacksTitle, UIView(), addButton])
        hStackView.axis = .horizontal
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.distribution = .equalSpacing
        hStackView.alignment = .fill
        hStackView.spacing = 0
        
        hStackViewSnacks.addArrangedSubview(burgerButton)
        hStackViewSnacks.addArrangedSubview(friesButton)
        hStackViewSnacks.addArrangedSubview(steakButton)
        hStackViewSnacks.addArrangedSubview(eggButton)
        hStackViewSnacks.addArrangedSubview(chickenButton)
        
        vContainerStackView.addArrangedSubview(hStackView)
        vContainerStackView.addArrangedSubview(addSnacksTitle)
        vContainerStackView.addArrangedSubview(hStackViewSnacks)
        
        navBarView.addSubview(vContainerStackView)
  
        vContainerStackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: -10).isActive = true
        vContainerStackView.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor, constant: -10).isActive = true
        vContainerStackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 10).isActive = true
        vContainerStackView.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 45).isActive = true
        view.addSubview(navBarView)
 
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
    
    @objc func openSnacks(_ sender: UIButton) {
        
        if isOpen {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .transitionCurlUp) {
                self.navBarView.frame = CGRect(x: 0, y: 0, width: self.width!, height: 90)
                self.addButton.transform = .identity
            }
            vContainerStackView.transform = .identity
        } else {
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: .transitionCurlDown) {
                self.navBarView.frame = CGRect(x: 0, y: 0, width: self.width!, height: 250)
                let rotateTransform = CGAffineTransform(rotationAngle: .pi/4)
                self.addButton.transform = rotateTransform
                let scaleTransform = CGAffineTransform(scaleX: 1, y: 1.05)
                self.vContainerStackView.transform = scaleTransform
            }
        }
        addSnacksTitle.isHidden.toggle()
        hStackViewSnacks.isHidden.toggle()
        isOpen.toggle()
        snacksTitle.isHidden.toggle()
    }
}

extension SnacksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let snack = snacks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SnackTableViewCell
        
        cell.snackLabel.text = snack
        return cell
    }
}
