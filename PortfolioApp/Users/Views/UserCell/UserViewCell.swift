import UIKit

final class UserViewCell: UITableViewCell {
    @IBOutlet private weak var userNiknameLabel: UILabel!
    @IBOutlet private weak var userNameText: UILabel!
    @IBOutlet private weak var userNiknameText: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    func setup(with user: User) {
        userNiknameLabel.text = R.string.texts.userUsername()
        
        self.userNameText.text = user.name
        self.userNiknameText.text = user.username
        self.emailLabel.text = user.email
        self.phoneLabel.text = user.phone
        self.websiteLabel.text = user.website
        self.companyLabel.text = user.company.name
        self.addressLabel.text = "\(user.address.city), \(user.address.street), \(user.address.suite), \(user.address.zipcode)"
    }
}
