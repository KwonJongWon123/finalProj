package com.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbMapper {

   List<MovieTimeDTO> movieTime();

   List<MovieInfoDTO> movieInfo();

   List<MovieInfoDTO> movieInfoBefore(String str);

   List<MovieInfoDTO> movieInfoAfter(String str);
   List<MovieInfoDTO> moviebeforsearch(String str);

   // 영화 시간표
   MovieInfoDTO movieDetail(Integer m_index);

   void insertMovieTime(MovieTimeDTO dto);
   void insertSit(UserSitDTO dto);
   
   MovieInfoDTO findMovie(String movietitle);
   void insertSales(SalesDTO dto);
   List<MovieTimeDTO> findMovieTime(String movietitle);
   
   int newSelectIndex();
   
   List<MovieInfoDTO> movielist();
   MovieTimeDTO movietimefindindex(Integer index);
   int updatemovielist(MovieTimeDTO dto);

   int deletemovie(Integer time_index);
   MovieTimeDTO findMovieindex(Integer index);
   
   List<MovieTimeDTO> movieTimeCheck(String movietitle);
   List<MovieTimeDTO> movieTimefind(String search);
   List<UserSitDTO> moviesit(Integer index);
   
   List<UserSitDTO> moviesitfind(Integer index);
   // 게시판 page 이동.
   int noticetotalCnt(HashMap<String, Object> map);

   // 영화정보 list
   List<MovieInfoDTO> movieinfolist(HashMap<String, Object> map);

   // 영화 제목으로 인덱스 Integer뽑아오기.
   Integer getIndexByTitle(String movietitle);

   // 영화정보insert
   List<ActorDTO> findactor(String actorname);

   void movieinfoinsert(MovieInfoDTO dto);

   void actormovieinsert(ActorDTO dto);

   void catemovieinsert(CateDTO dto);

   void movieimgin(MimgDTO dto);

   // 영화당 review
   List<MovieReviewDTO> review(HashMap<String, Object> map);
   //해당 영화의 내 리뷰
   MovieReviewDTO myReview(InfoDTO info);
   Integer totalCnt(HashMap<String, Object> map);
   
   
   //리뷰 저장하기
   Integer reviewinsert(MovieReviewDTO dto);
   //리뷰 삭제하기
   Integer reviewdelete(MovieReviewDTO dto);
   //리뷰 수정하기
   Integer reviewmodify(MovieReviewModDTO rnd);
   
   //endtime 가져오기
   DateDTO BringEndTime(Integer time_index);
   //index로 movietitle검색
   String foundmoviename(Integer m_index);
   //본 영화 list 가져오기
   List<MoviewatchInfo> watched(MovieReviewDTO dto);
   //좋아요 업데이트하기
   Integer likeupdate(LikeDTO dto);
   //영화별 좋아요 수 가져오기(userlikes에서 컬럼 세서 가져옴)
   Integer selectlike(Integer m_index);
   //movieinfo mlike의 값을 변경
   void updatemlike(LikeDTO dto);
   //userlikes에서 해당하는 id의 like 정보 지운다
   void deletelike(LikeDTO dto);
   //review에서 평점 calc하기
   Integer calcGPA(Integer m_index);
   
   //예매 테이블 전체개수 가져옴
   Integer allcount(Integer m_index);
   //예매 테이블에서 해당 영화 예매된 개수만 가져옴
   Integer detailCount(Integer m_index);
   //관 입력하면 3일동안의 관의 개수 나옴
   Integer pullSeatNum(String sectorno);
   
   /* 예매율 계산 test */
   List<MovieRateDTO> pulltime_index();
   String FoundMovietitle(Integer time_index);
   String FoundSector(Integer sector);
   
   MovieInfoDTO pullmovieinfo(String movietitle);

   List<ActorDTO> pullactor(Integer m_index);

   List<CateDTO> pullcate(Integer m_index);

   List<MimgDTO> pullimg(Integer m_index);

   
   
   
   	void memjoin(MemberDTO mdto);
   	int memcancelinsert(MemberDTO mdto);

   	MemberDTO memlogin(MemberDTO mdto);

   	int memModify(MemberDTO mdto);
   	int memDelete(MemberDTO mdto);
	
   	List<Map<String, String>> memlikeinfor(MemberDTO mdto);
   	List<Map<String, String>> memcomment(MemberDTO mdto);
	List<Map<String, String>> memqna(MemberDTO mdto);
	List<Map<String, String>> mempurchase(MemberDTO mdto);
	List<Map<String, String>> memcancelpurchase(MemberDTO mdto);
	Map<String, Integer> memcount(MemberDTO mdto);
   
   
   
   

   // 유저메인화면 베너 관리용.
   int deleteBanner(BannerDTO bannerdto);

   void insertBanner(BannerDTO bannerdto);

   int changeBanner(BannerDTO bannerdto);

   List<BannerDTO> selectBanner();

   
   
   
   
   

   //현준 Service C
   
   void insertPersQna(ServiceFullDTO sfDTO); //1대1문의넣기
   
   List<ServiceFullDTO> noticelist(HashMap<String, Object> map); //공지사항보기
   
   void insertNotice(ServiceFullDTO sfDTO); //어드민딴에서 공지 추가하기
   
   ServiceFullDTO noticedetail(ServiceFullDTO sfDTO); //공지사항 디테일보기
   
   void addCount(ServiceFullDTO sfDTO); //주회수 증가
   
   ServiceFullDTO noticeNext(ServiceFullDTO sfDTO); //공지사항 다음글
   
   ServiceFullDTO noticeBefore(ServiceFullDTO sfDTO); //공지사항 이전글
   
   int noticedelete(ServiceFullDTO sfDTO); //공지사항 삭제
   
   int noticemodify (ServiceFullDTO sfDTO); //공지사항 수정
   
   ////////////////////////////////////////////////1대1
   List<ServiceFullDTO> perslist(HashMap<String, Object> map); //1대1문의(미답변보기)
   
   int perstotalCnt(HashMap<String, Object> map); //1대1총갯수(미답변)
   int perstotalCnt2(HashMap<String, Object> map); //1대1총갯수(답변완료)

   ServiceFullDTO persdetail(ServiceFullDTO sfDTO); //1대1 디테일보기(미답변)

   int persans (ServiceFullDTO sfDTO); //1대1 답변하기 (답변완료)
   
   List<ServiceFullDTO> perslistans(HashMap<String, Object> map); //1대1문의(답변완료보기)
   
   List<ServiceFullDTO> perslistanscate(HashMap<String, Object> map); //1대1문의(답변완료보기)
   
   int perstotalansCnt(HashMap<String, Object> map); //1대1총갯수(답변완료)
   
   List<ServiceFullDTO> pershistory(HashMap<String, Object> map); //상담내역화깅ㄴ
   
   List<ServiceFullDTO> pershistoryuser(HashMap<String, Object> map); //상담내역화r\긴 (유저) desc
   
   int pershistoryCnt(HashMap<String, Object> map); //상담내역화깅ㄴ갯수

   List<ServiceFullDTO> noticelistcate(HashMap<String, Object> map); //공지 카테별
   int noticecatetotalCnt(HashMap<String, Object> map); //공지 카테카운트
   
   List<ServiceFullDTO> persview(HashMap<String, Object> map); //어드민메인 3개만보기 (1대1
   List<ServiceFullDTO> notiview(HashMap<String, Object> map); //어드민메인 3개만보기 (공지

   
   
   
   
   
   
   
   
   
   
   
   
   
   //매출 관련 
   
   void insertdaysale(SalesDTO saleDTO);
   int updateSSdaily(SalesDTO salesDTO);
   
   
   //매출관련기능 of 관리자. 
   List<SalesDTO> getsalesbyId(String userid);
   List<SalesDTO> getsales(HashMap<String, Object> map);
   List<SalesDTO> getyesterdaysales(HashMap<String, Object> map);
   List<SalesDTO> getMonthlygraph(TimeVO timeVO);List<SalesDTO> getMonthlygraph1(TimeVO timeVO);List<SalesDTO> getMonthlygraph2(TimeVO timeVO);List<SalesDTO> getMonthlygraph3(TimeVO timeVO);List<SalesDTO> getMonthlygraph4(TimeVO timeVO);	List<SalesDTO> getMonthlygraph5(TimeVO timevo);

   List<ServiceFullDTO> getfaq(HashMap<String, Object> map);

   int aaatotalCnt(HashMap<String, Object> map);
   void insertfaq(ServiceFullDTO sfDTO);
   int modifyfaq(ServiceFullDTO sfDTO);
   int deletefaq(ServiceFullDTO sfDTO);
   ServiceFullDTO detailfaq(ServiceFullDTO sfDTO);
   List<ServiceFullDTO> faqview(HashMap<String, Object> map);
   void addcntfaq(ServiceFullDTO sfDTO);
   int updatepostername(MovieInfoDTO mdto);
   
   //김인호추가
   MovieInfoDTO getmovieinfobyidx(int indexnum);
   void deleteMovieinfo(int m_index);
   int updateMovieinfo(MovieInfoDTO mdto);
// 스케쥴러작동월매출
   List<SalesDTO> getyesterdaysalesdistinct(HashMap<String, Object> map);
   void insertmonthsales(SalesDTO forfirstday);// 첫날에 튜플 추가용.
	int updatemonthsales(SalesDTO sdto);

	Integer salestotalCnt(HashMap<String, Object> map);	Integer salestotalCnt2(HashMap<String, Object> map);

	int salesindexlink(UserSitDTO userSitDTO);

	int faqtotalCnt(HashMap<String, Object> map);


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   // 어드민 로그인 용 
	AdminaccDTO adminloginCheck(AdminaccDTO adacDTO);

	ArrayList<BannerDTO> getbannerimgs();

	List<MovieInfoDTO> movielistbanner();//

	List<SalesDTO> getsalesdaily(HashMap<String, Object> map);

	List<SalesDTO> adminmainsales();




   
   
   
}