//
//  CategoryViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/23.
//

import UIKit
import ExpyTableView

struct Section {
    var isOpend = Bool()
    var title = String()
    var data = [String]()
    var image = UIImage()
    var sectionNumber = Int()
    var rowNumber = Int()
    var pageMoveFlag = Bool()
}

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    private var cellExpanded: Bool = false

    private var sectionsData = [Section]()
    
    lazy var shoppingButton: UIBarButtonItem = {
        let buttonIcon = UIImage(named: "outline_shopping_cart_white_36pt")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(shoppingBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .white
        return button
    }()
    
    @objc func shoppingBtn(_ sender:UIBarButtonItem!) {
        
    }
    
    lazy var mapButton: UIBarButtonItem = {
        let buttonIcon = UIImage(named: "outline_location_on_white_36pt")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(mapBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .white
        return button
    }()
    
    @objc func mapBtn(_ sender:UIBarButtonItem!) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationSetup()
        createCategoryDatas()
    }
    
    func navigationSetup() {
        self.navigationItem.title = "카테고리"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        self.navigationItem.rightBarButtonItems = [shoppingButton, mapButton]
    }
    
    private func createCategoryDatas() {
        sectionsData = [
            Section(isOpend: false, title: "채소", data: ["전체보기", "친환경", "고구마・감자・당근", "시금치・쌈채소・나물", "브로콜리・파프리카・양배추", "양파・대파・마늘・배추", "오이・호박・고추", "냉동・이색・간편채소", "콩나물・버섯"], image: UIImage(named: "beet")!),
            Section(isOpend: false, title: "과일・견과・쌀", data: ["전체보기", "친환경", "제철과일", "국산과일", "수입과일", "간편과일", "냉동・건과일", "견과류", "쌀・잡곡"], image: UIImage(named: "fruits")!),
            Section(isOpend: false, title: "수산・해산・건어물", data: ["전체보기", "제철수산", "생선류", "굴비・반건류", "오징어・낙지・문어", "새우・게・랍스터", "해산물・조개류", "수산가공품", "김・미역・해조류", "건어물・다시팩"], image: UIImage(named: "fish")!),
            Section(isOpend: false, title: "정육・계란", data: ["전체보기", "국내산 소고기", "수입산 소고기", "돼지고기", "계란류", "닭・오리고기", "양념육・돈까스", "양고기"], image: UIImage(named: "meat")!),
            Section(isOpend: false, title: "국・반찬・메인요리", data: ["전체보기", "국・탕・찌개", "밀키트・메인요리", "밑반찬", "김치・젓갈・장류", "두무・어묵・부침개", "베이컨・햄・통조림"], image: UIImage(named: "rice")!),
            Section(isOpend: false, title: "샐러드・간편식", data: ["전체보기", "샐러드・닭가슴살", "도시락・밥류", "파스타・면류", "떡볶이・튀김・순대", "피자・핫도그・만두", "폭립・떡갈비・안주", "죽・스프・카레", "선식・시리얼"], image: UIImage(named: "salad")!),
            Section(isOpend: false, title: "면・양념・요리", data: ["전체보기", "파스타・면류", "식초・소스・드레싱", "양념・액젓・장류", "식용유・참기름・오일", "소금・설탕・향신료", "밀가루・가루・믹스"], image: UIImage(named: "seasoning")!),
            Section(isOpend: false, title: "생수・음료・우유・커피", data: ["전체보기", "생수・탄산수", "음료・주수", "우유・두유・요거트", "커피", "차"], image: UIImage(named: "milk")!),
            Section(isOpend: false, title: "간식・과자・떡", data: ["전체보기", "과자・스낵・쿠키", "초콜릿・젤리・캔디", "떡・한과", "아이스크림"], image: UIImage(named: "cookie")!),
            Section(isOpend: false, title: "베이커리・치즈・델리", data: ["전체보기", "식빵・빵류", "잼・버터・스프레드", "케이크・파이・디저트", "치즈", "델리", "올리브・피클"], image: UIImage(named: "bread")!),
            Section(isOpend: false, title: "건강식품", data: ["전체보기", "영양제", "유산균", "홍삼・인삼・꿀", "건강즙・건강음료", "건강분말・건강환", "다이어트・이너뷰티", "유아동"], image: UIImage(named: "medicine")!),
            Section(isOpend: false, title: "생활용품・리빙", data: ["전체보기", "휴지・티슈", "여성・위생용품", "세제・청소용품", "화훼・인테리어소품", "의약외품・마스크", "생활잡화・문구", "캠핑용품"], image: UIImage(named: "household")!),
            Section(isOpend: false, title: "스킨케어・메이크업", data: ["전체보기", "스킨・미스트・패드", "에센스・앰플・로션", "크림・오일", "클렌징", "마스크팩", "선케어", "메이크업", "맨즈케어", "뷰티소품・기기"], image: UIImage(named: "makeup")!),
            Section(isOpend: false, title: "헤어・바디・구강", data: ["전체보기", "구강・면도", "샴푸・컨디셔너", "트리트먼트・팩", "헤어에센스・염모", "바디워시・스크럽", "바디로션・크림", "핸드・립・데오", "헤어・바디소품"], image: UIImage(named: "shampoo")!),
            Section(isOpend: false, title: "주방용품", data: ["전체보기", "주방소모품・잡화", "주방・조리도구", "냄비・팬・솥", "보관용기・텀블러", "식기・테이블웨어", "컵・잔・커피도구"], image: UIImage(named: "kitchen-utensils")!),
            Section(isOpend: false, title: "가전제품", data: ["전체보기", "주방가전", "생활가전", "계절가전", "디지털・PC"], image: UIImage(named: "vacuum")!),
            Section(isOpend: false, title: "베이비・키즈", data: ["전체보기", "분유・간편・이유식", "이유식 재료", "간식・음식・음료", "건강식품", "이유・수유용품", "기저귀・물티슈", "세제・위생용품", "스킨・구강케어", "완구・잡화류"], image: UIImage(named: "baby-bottle")!),
            Section(isOpend: false, title: "반려동물", data: ["전체보기", "강아지 간식", "강아지 주식", "고양이 간식", "고양이 주식", "반려동물 용품", "배변・위생", "소용량・샘플"], image: UIImage(named: "pet-food")!)
        ]
        
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            print(sectionsData.count)
            return sectionsData.count
        }
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "자주가는 상품"
            return cell
        case 1:
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "expendingCell", for: indexPath) as! CategoryCustomTableViewCell
            cell.nameLabel.text = sectionsData[indexPath.row].title
            cell.imageView?.image = sectionsData[indexPath.row].image
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1) {
            
            if(indexPath.row == 0) {
                
                if( cellExpanded ) {
                    cellExpanded = false
                }
                else {
                    cellExpanded = true
                }
                
                categoryTableView.beginUpdates()
                categoryTableView.endUpdates()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if cellExpanded {
                return 250
            }
            else {
                return 50
            }
        }
        else {
            return 50
        }
         
    }
    
}

//struct Section {
//    var isOpend = Bool()
//    var title = String()
//    var data = [String]()
//    var image = UIImage()
//    var sectionNumber = Int()
//    var rowNumber = Int()
//    var pageMoveFlag = Bool()
//}
//
//class CategoryViewController: UIViewController {
//
//    @IBOutlet weak var categoryTableView: UITableView!
//
//    var hiddenSections = Set<Int>()
//    let tableViewData = [
//        ["1","2","3","4","5"],
//        ["1","2","3","4","5"],
//        ["1","2","3","4","5"],
//        ["1","2","3","4","5"],
//        ["1","2","3","4","5"],
//    ]
//
//    private var sections = [Section]()
//
//    lazy var shoppingButton: UIBarButtonItem = {
//        let buttonIcon = UIImage(named: "outline_shopping_cart_white_36pt")
//        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(shoppingBtn(_:)))
//        button.image = buttonIcon
//        button.tintColor = .white
//        return button
//    }()
//
//    @objc func shoppingBtn(_ sender:UIBarButtonItem!) {
//
//    }
//
//    lazy var mapButton: UIBarButtonItem = {
//        let buttonIcon = UIImage(named: "outline_location_on_white_36pt")
//        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(mapBtn(_:)))
//        button.image = buttonIcon
//        button.tintColor = .white
//        return button
//    }()
//
//    @objc func mapBtn(_ sender:UIBarButtonItem!) {
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        categoryTableView.delegate = self
//        categoryTableView.dataSource = self
//
//        createCategoryDatas()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        navigationSetup()
//    }
//
//    func navigationSetup() {
//        self.navigationItem.title = "카테고리"
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.tintColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
//        self.navigationItem.rightBarButtonItems = [shoppingButton, mapButton]
//    }
//
//    private func createCategoryDatas() {
//        sections = [
//            Section(isOpend: false, title: "채소", data: ["전체보기", "친환경", "고구마・감자・당근", "시금치・쌈채소・나물", "브로콜리・파프리카・양배추", "양파・대파・마늘・배추", "오이・호박・고추", "냉동・이색・간편채소", "콩나물・버섯"], image: UIImage(named: "beet")!),
//            Section(isOpend: false, title: "과일・견과・쌀", data: ["전체보기", "친환경", "제철과일", "국산과일", "수입과일", "간편과일", "냉동・건과일", "견과류", "쌀・잡곡"], image: UIImage(named: "fruits")!),
//            Section(isOpend: false, title: "수산・해산・건어물", data: ["전체보기", "제철수산", "생선류", "굴비・반건류", "오징어・낙지・문어", "새우・게・랍스터", "해산물・조개류", "수산가공품", "김・미역・해조류", "건어물・다시팩"], image: UIImage(named: "fish")!),
//            Section(isOpend: false, title: "정육・계란", data: ["전체보기", "국내산 소고기", "수입산 소고기", "돼지고기", "계란류", "닭・오리고기", "양념육・돈까스", "양고기"], image: UIImage(named: "meat")!),
//            Section(isOpend: false, title: "국・반찬・메인요리", data: ["전체보기", "국・탕・찌개", "밀키트・메인요리", "밑반찬", "김치・젓갈・장류", "두무・어묵・부침개", "베이컨・햄・통조림"], image: UIImage(named: "rice")!),
//            Section(isOpend: false, title: "샐러드・간편식", data: ["전체보기", "샐러드・닭가슴살", "도시락・밥류", "파스타・면류", "떡볶이・튀김・순대", "피자・핫도그・만두", "폭립・떡갈비・안주", "죽・스프・카레", "선식・시리얼"], image: UIImage(named: "salad")!),
//            Section(isOpend: false, title: "면・양념・요리", data: ["전체보기", "파스타・면류", "식초・소스・드레싱", "양념・액젓・장류", "식용유・참기름・오일", "소금・설탕・향신료", "밀가루・가루・믹스"], image: UIImage(named: "seasoning")!),
//            Section(isOpend: false, title: "생수・음료・우유・커피", data: ["전체보기", "생수・탄산수", "음료・주수", "우유・두유・요거트", "커피", "차"], image: UIImage(named: "milk")!),
//            Section(isOpend: false, title: "간식・과자・떡", data: ["전체보기", "과자・스낵・쿠키", "초콜릿・젤리・캔디", "떡・한과", "아이스크림"], image: UIImage(named: "cookie")!),
//            Section(isOpend: false, title: "베이커리・치즈・델리", data: ["전체보기", "식빵・빵류", "잼・버터・스프레드", "케이크・파이・디저트", "치즈", "델리", "올리브・피클"], image: UIImage(named: "bread")!),
//            Section(isOpend: false, title: "건강식품", data: ["전체보기", "영양제", "유산균", "홍삼・인삼・꿀", "건강즙・건강음료", "건강분말・건강환", "다이어트・이너뷰티", "유아동"], image: UIImage(named: "medicine")!),
//            Section(isOpend: false, title: "생활용품・리빙", data: ["전체보기", "휴지・티슈", "여성・위생용품", "세제・청소용품", "화훼・인테리어소품", "의약외품・마스크", "생활잡화・문구", "캠핑용품"], image: UIImage(named: "household")!),
//            Section(isOpend: false, title: "스킨케어・메이크업", data: ["전체보기", "스킨・미스트・패드", "에센스・앰플・로션", "크림・오일", "클렌징", "마스크팩", "선케어", "메이크업", "맨즈케어", "뷰티소품・기기"], image: UIImage(named: "makeup")!),
//            Section(isOpend: false, title: "헤어・바디・구강", data: ["전체보기", "구강・면도", "샴푸・컨디셔너", "트리트먼트・팩", "헤어에센스・염모", "바디워시・스크럽", "바디로션・크림", "핸드・립・데오", "헤어・바디소품"], image: UIImage(named: "shampoo")!),
//            Section(isOpend: false, title: "주방용품", data: ["전체보기", "주방소모품・잡화", "주방・조리도구", "냄비・팬・솥", "보관용기・텀블러", "식기・테이블웨어", "컵・잔・커피도구"], image: UIImage(named: "kitchen-utensils")!),
//            Section(isOpend: false, title: "가전제품", data: ["전체보기", "주방가전", "생활가전", "계절가전", "디지털・PC"], image: UIImage(named: "vacuum")!),
//            Section(isOpend: false, title: "베이비・키즈", data: ["전체보기", "분유・간편・이유식", "이유식 재료", "간식・음식・음료", "건강식품", "이유・수유용품", "기저귀・물티슈", "세제・위생용품", "스킨・구강케어", "완구・잡화류"], image: UIImage(named: "baby-bottle")!),
//            Section(isOpend: false, title: "반려동물", data: ["전체보기", "강아지 간식", "강아지 주식", "고양이 간식", "고양이 주식", "반려동물 용품", "배변・위생", "소용량・샘플"], image: UIImage(named: "pet-food")!)
//        ]
//
//    }
//}
//
//extension CategoryViewController: UITableViewDataSource{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if sections[section].isOpend {
//            return sections[section].data.count + 1
//        }
//        else {
//            return 1
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        switch indexPath.row {
//        case 0:
//            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = sections[indexPath.section].title
//            cell.imageView?.image = sections[indexPath.section].image
//            return cell
//
//        default:
//            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "expendingCell", for: indexPath)
//            cell.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
//            cell.selectionStyle = .none
//            cell.textLabel?.text = sections[indexPath.section].data[indexPath.row - 1]
//            return cell
//        }
//    }
//
//}
//
//extension CategoryViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section, row", indexPath.section, indexPath.row)
//        if indexPath.row == 0 {
//            sections[indexPath.section].isOpend.toggle()
//
//            OperationQueue.main.addOperation {
//                self.categoryTableView.reloadData()
//            }
//        }
//
//        else {
//            let vegetableVC = self.storyboard?.instantiateViewController(identifier: "mainCategoryVC") as! MainCategoryViewController
//            vegetableVC.section = sections[indexPath.section]
//            vegetableVC.section.rowNumber = indexPath.row
//            vegetableVC.section.pageMoveFlag = true
//            self.navigationController?.pushViewController(vegetableVC, animated: true)
//        }
//    }
//}

