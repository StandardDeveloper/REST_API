//
//  CategoryViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/23.
//

import UIKit
import ExpyTableView

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: ExpyTableView!
    
    let titleName: Array<String> = ["채소", "과일・견과・쌀", "수산・해산・건어물", "정육・계란", "국・반찬・메인요리", "샐러드・간편식", "면・양념・요리", "생수・음료・우유・커피", "간식・과자・떡", "베이커리・치즈・델리", "건강식품", "생활용품・리빙", "스킨케어・메이크업", "헤어・바디・구강", "주방용품", "가전제품", "베이비・키즈", "반려동물" ]
    
    let vegetableList: Array<String> = ["채소","전체보기", "친환경", "고구마・감자・당근", "시금치・쌈채소・나물", "브로콜리・파프리카・양배추", "양파・대파・마늘・배추", "오이・호박・고추", "냉동・이색・간편채소", "콩나물・버섯"]
    let fruitList: Array<String> = ["과일・견과・쌀", "전체보기", "친환경", "제철과일", "국산과일", "수입과일", "간편과일", "냉동・건과일", "견과류", "쌀・잡곡"]
    let seeFoodList: Array<String> = ["수산・해산・건어물", "전체보기", "제철수산", "생선류", "굴비・반건류", "오징어・낙지・문어", "새우・게・랍스터", "해산물・조개류", "수산가공품", "김・미역・해조류", "건어물・다시팩"]
    let meatList: Array<String> = ["정육・계란", "전체보기", "국내산 소고기", "수입산 소고기", "돼지고기", "계란류", "닭・오리고기", "양념육・돈까스", "양고기"]
    let soupList: Array<String> = ["국・반찬・메인요리", "전체보기", "국・탕・찌개", "밀키트・메인요리", "밑반찬", "김치・젓갈・장류", "두무・어묵・부침개", "베이컨・햄・통조림"]
    let saladList: Array<String> = ["샐러드・간편식", "전체보기", "샐러드・닭가슴살", "도시락・밥류", "파스타・면류", "떡볶이・튀김・순대", "피자・핫도그・만두", "폭립・떡갈비・안주", "죽・스프・카레", "선식・시리얼"]
    let noodleList: Array<String> = ["면・양념・요리", "전체보기", "파스타・면류", "식초・소스・드레싱", "양념・액젓・장류", "식용유・참기름・오일", "소금・설탕・향신료", "밀가루・가루・믹스"]
    let waterList: Array<String> = ["생수・음료・우유・커피", "전체보기", "생수・탄산수", "음료・주수", "우유・두유・요거트", "커피", "차"]
    let snackList: Array<String> = ["간식・과자・떡", "전체보기", "과자・스낵・쿠키", "초콜릿・젤리・캔디", "떡・한과", "아이스크림"]
    let bakeryList: Array<String> = ["베이커리・치즈・델리", "전체보기", "식빵・빵류", "잼・버터・스프레드", "케이크・파이・디저트", "치즈", "델리", "올리브・피클"]
    let healthList: Array<String> = ["건강식품", "전체보기", "영양제", "유산균", "홍삼・인삼・꿀", "건강즙・건강음료", "건강분말・건강환", "다이어트・이너뷰티", "유아동"]
    let livingList: Array<String> = ["생활용품・리빙", "전체보기", "휴지・티슈", "여성・위생용품", "세제・청소용품", "화훼・인테리어소품", "의약외품・마스크", "생활잡화・문구", "캠핑용품"]
    let skinCareList: Array<String> = ["스킨케어・메이크업", "전체보기", "스킨・미스트・패드", "에센스・앰플・로션", "크림・오일", "클렌징", "마스크팩", "선케어", "메이크업", "맨즈케어", "뷰티소품・기기"]
    let hairList: Array<String> = ["헤어・바디・구강", "전체보기", "구강・면도", "샴푸・컨디셔너", "트리트먼트・팩", "헤어에센스・염모", "바디워시・스크럽", "바디로션・크림", "핸드・립・데오", "헤어・바디소품"]
    let kitchenList: Array<String> = ["주방용품", "전체보기", "주방소모품・잡화", "주방・조리도구", "냄비・팬・솥", "보관용기・텀블러", "식기・테이블웨어", "컵・잔・커피도구"]
    let HomeApplianceList: Array<String> = ["가전제품", "전체보기", "주방가전", "생활가전", "계절가전", "디지털・PC"]
    let babyList: Array<String> = ["베이비・키즈", "전체보기", "분유・간편・이유식", "이유식 재료", "간식・음식・음료", "건강식품", "이유・수유용품", "기저귀・물티슈", "세제・위생용품", "스킨・구강케어", "완구・잡화류"]
    let petList: Array<String> = ["반려동물", "전체보기", "강아지 간식", "강아지 주식", "고양이 간식", "고양이 주식", "반려동물 용품", "배변・위생", "소용량・샘플"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.rowHeight = UITableView.automaticDimension
        categoryTableView.rowHeight  = 60
        categoryTableView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        
        self.navigationItem.title = "카테고리"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}


extension CategoryViewController: ExpyTableViewDelegate, ExpyTableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 1
        case 1:
            return vegetableList.count
        case 2:
            return fruitList.count
        case 3:
            return seeFoodList.count
        case 4:
            return meatList.count
        case 5:
            return soupList.count
        case 6:
            return saladList.count
        case 7:
            return noodleList.count
        case 8:
            return waterList.count
        case 9:
            return snackList.count
        case 10:
            return bakeryList.count
        case 11:
            return healthList.count
        case 12:
            return livingList.count
        case 13:
            return skinCareList.count
        case 14:
            return hairList.count
        case 15:
            return kitchenList.count
        case 16:
            return HomeApplianceList.count
        case 17:
            return babyList.count
        case 18:
            return petList.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 1) {
            return 10.0
        }
        else if(section == 19) {
            return 10.0
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        return v
    }

    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("Current state: \(state)")
        print("Section : \(section)")
    }

    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }

    //섹션 내용
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.backgroundColor = .none //백그라운드 컬러
        cell.selectionStyle = .none //선택했을 때 회색되는거 없애기
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.tintColor = .lightGray

        switch section {
        case 0:
            cell.textLabel?.text = "자주 사는 상품"
        case 1:
            cell.textLabel?.text = titleName[0]
            cell.imageView?.image = UIImage(named: "beet")
        case 2:
            cell.textLabel?.text = titleName[1]
            cell.imageView?.image = UIImage(named: "fruits")
        case 3:
            cell.textLabel?.text = titleName[2]
            cell.imageView?.image = UIImage(named: "fish")
        case 4:
            cell.textLabel?.text = titleName[3]
            cell.imageView?.image = UIImage(named: "meat")
        case 5:
            cell.textLabel?.text = titleName[4]
            cell.imageView?.image = UIImage(named: "rice")
        case 6:
            cell.textLabel?.text = titleName[5]
            cell.imageView?.image = UIImage(named: "salad")
        case 7:
            cell.textLabel?.text = titleName[6]
            cell.imageView?.image = UIImage(named: "seasoning")
        case 8:
            cell.textLabel?.text = titleName[7]
            cell.imageView?.image = UIImage(named: "milk")
        case 9:
            cell.textLabel?.text = titleName[8]
            cell.imageView?.image = UIImage(named: "cookie")
        case 10:
            cell.textLabel?.text = titleName[9]
            cell.imageView?.image = UIImage(named: "bread")
        case 11:
            cell.textLabel?.text = titleName[10]
            cell.imageView?.image = UIImage(named: "medicine")
        case 12:
            cell.textLabel?.text = titleName[11]
            cell.imageView?.image = UIImage(named: "household")
        case 13:
            cell.textLabel?.text = titleName[12]
            cell.imageView?.image = UIImage(named: "makeup")
        case 14:
            cell.textLabel?.text = titleName[13]
            cell.imageView?.image = UIImage(named: "shampoo")
        case 15:
            cell.textLabel?.text = titleName[14]
            cell.imageView?.image = UIImage(named: "kitchen-utensils")
        case 16:
            cell.textLabel?.text = titleName[15]
            cell.imageView?.image = UIImage(named: "vacuum")
        case 17:
            cell.textLabel?.text = titleName[16]
            cell.imageView?.image = UIImage(named: "baby-bottle")
        case 18:
            cell.textLabel?.text = titleName[17]
            cell.imageView?.image = UIImage(named: "pet-food")
        default:
            cell.textLabel?.text = ""
        }

        return cell
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        DispatchQueue.main.async {
            cell.addAboveTheBottomBorderWithColor(color: UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0))
        }
        
        categoryTableView.rowHeight  = 60
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "자주 사는 상품"
        case 1:
            cell.textLabel?.text = vegetableList[indexPath.row]
        case 2:
            cell.textLabel?.text = fruitList[indexPath.row]
        case 3:
            cell.textLabel?.text = seeFoodList[indexPath.row]
        case 4:
            cell.textLabel?.text = meatList[indexPath.row]
        case 5:
            cell.textLabel?.text = soupList[indexPath.row]
        case 6:
            cell.textLabel?.text = saladList[indexPath.row]
        case 7:
            cell.textLabel?.text = noodleList[indexPath.row]
        case 8:
            cell.textLabel?.text = waterList[indexPath.row]
        case 9:
            cell.textLabel?.text = snackList[indexPath.row]
        case 10:
            cell.textLabel?.text = bakeryList[indexPath.row]
        case 11:
            cell.textLabel?.text = healthList[indexPath.row]
        case 12:
            cell.textLabel?.text = livingList[indexPath.row]
        case 13:
            cell.textLabel?.text = skinCareList[indexPath.row]
        case 14:
            cell.textLabel?.text = hairList[indexPath.row]
        case 15:
            cell.textLabel?.text = kitchenList[indexPath.row]
        case 16:
            cell.textLabel?.text = HomeApplianceList[indexPath.row]
        case 17:
            cell.textLabel?.text = babyList[indexPath.row]
        case 18:
            cell.textLabel?.text = petList[indexPath.row]
        default:
           print("")
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       
        switch indexPath.section {
        case 0:
            let favoriteProductVC = self.storyboard?.instantiateViewController(withIdentifier: "favoriteProductVC") as! FavoriteProductViewController
            self.navigationController?.pushViewController(favoriteProductVC, animated: true)
            favoriteProductVC.navTitle = "자주 사는 상품"
            break
        case 1:
            if(indexPath.row == 1) {
                let vegetableVC = self.storyboard?.instantiateViewController(identifier: "vegetableVC") as! VegetableViewController
                self.navigationController?.pushViewController(vegetableVC, animated: true)
            }
            else if(indexPath.row == 2){
                //인덱스 다른 클래스에 넘기고 싶은데 어떻게 해야될지...
            }
            break
        default:
            print("///////")
        }
    }
}

extension UIView {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }

    func addAboveTheBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
}
