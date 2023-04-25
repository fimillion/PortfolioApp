import UIKit

final class UserViewCell: UITableViewCell {
    @IBOutlet private weak var userNiknameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var userNameText: UILabel!
    @IBOutlet private weak var userNiknameText: UILabel!
    @IBOutlet private weak var emailText: UILabel!
    @IBOutlet private weak var phoneText: UILabel!
    @IBOutlet private weak var websiteText: UILabel!
    @IBOutlet private weak var companyText: UILabel!
    @IBOutlet private weak var addressText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    func setup(with user: User) {
        self.userNiknameLabel.text = R.string.texts.userUsername()
        self.emailLabel.text = R.string.texts.userEmail()
        self.phoneLabel.text = R.string.texts.userPhone()
        self.userNameText.text = user.name
        self.userNiknameText.text = user.username
        self.emailText.text = user.email
        self.phoneText.text = user.phone
        self.websiteText.text = user.website
        self.companyText.text = user.company.name
        self.addressText.text = """
            \(user.address.city), \(user.address.street), \(user.address.suite), \(user.address.zipcode)
            """
    }
}
