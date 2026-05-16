import image from '@ohos.multimedia.image';
import avMusicTemplate from '@ohos.multimedia.avMusicTemplate';
import { WantAgent, wantAgent } from '@kit.AbilityKit';
import { CommonConstants } from '../constants/CommonConstants.test';

const SUCCESS_MSG = 'success';

export class FakerDataUtil {
  static getOperResult(code: int = CommonConstants.SUCCESS_CODE): avMusicTemplate.OperResult {
    return {
      errorCode: code,
      errorMsg: SUCCESS_MSG,
    }
  }

  static async getMediaTab() {
    let tab: avMusicTemplate.MediaTab = {
      tabId: 'tabId1',
      tabName: 'tabName1',
      tabIcon: await FakerDataUtil.getPixelMap(),
      extraDataJson: '{"testkey": "testvalue"}'
    }
    return tab;
  }

  static async getMediaTabList() {
    let result: avMusicTemplate.MediaTab[] = [];
    let tab1: avMusicTemplate.MediaTab = {
      tabId: 'tabId1',
      tabName: 'tabName1',
      tabIcon: await FakerDataUtil.getPixelMap(),
      extraDataJson: '{"testkey": "testvalue"}'
    }
    let tab2: avMusicTemplate.MediaTab = {
      tabId: 'tabId2',
      tabName: 'tabName2',
      tabIcon: await FakerDataUtil.getPixelMap(),
      extraDataJson: '{"testkey": "testvalue"}'
    }
    let tab3: avMusicTemplate.MediaTab = {
      tabId: 'tabId3',
      tabName: 'tabName3',
      tabIcon: await FakerDataUtil.getPixelMap(),
      extraDataJson: '{"testkey": "testvalue"}'
    }
    result.push(tab1);
    result.push(tab2);
    result.push(tab3);
    return result;
  }

  static getMediaEntity(tag: string = 'tag'): avMusicTemplate.MediaEntity {
    return {
      mediaId: `123456_${tag}`,
      mediaType: avMusicTemplate.EntityType.fromValue(1),
      parentId: `654321_${tag}`,
      parentMediaType: avMusicTemplate.EntityType.fromValue(1),
      title: `title_${tag}`,
      desc: `desc_${tag}`,
      imageUrl: `https://123test.${tag}.com`,
      playState: avMusicTemplate.PlaybackState.fromValue(1),
    }
  }

  static getRanking(tag: string = 'tag'): avMusicTemplate.Ranking {
    return {
      mediaId: `123456_${tag}`,
      mediaType: avMusicTemplate.EntityType.fromValue(1),
      parentId: `654321_${tag}`,
      parentMediaType: avMusicTemplate.EntityType.fromValue(1),
      title: `title_${tag}`,
      desc: `desc_${tag}`,
      imageUrl: `https://123test.${tag}.com`,
      playState: avMusicTemplate.PlaybackState.fromValue(1),
      topElements: [FakerDataUtil.getMediaEntity()]
    }
  }


  static getBanner(tag: string = 'tag'): avMusicTemplate.Banner {
    return {
      mediaId: `123456_${tag}`,
      mediaType: avMusicTemplate.EntityType.fromValue(1),
      parentId: `654321_${tag}`,
      parentMediaType: avMusicTemplate.EntityType.fromValue(1),
      title: `title_${tag}`,
      desc: `desc_${tag}`,
      imageUrl: `https://123test.${tag}.com`,
      playState: avMusicTemplate.PlaybackState.fromValue(1),
      isSupportOnePlay: true,
    }
  }

  static getAlbum(tag: string = 'tag'): avMusicTemplate.Album {
    return {
      mediaId: `123456_${tag}`,
      mediaType: avMusicTemplate.EntityType.fromValue(1),
      parentId: `654321_${tag}`,
      parentMediaType: avMusicTemplate.EntityType.fromValue(1),
      title: `title_${tag}`,
      desc: `desc_${tag}`,
      imageUrl: `https://123test.${tag}.com`,
      playState: avMusicTemplate.PlaybackState.fromValue(1),
      singer: 'a singer',
      playCounts: '1000w',
      favSubscribeData: FakerDataUtil.getFavSubscribeData(),
      episodeCounts: '99999+'
    }
  }

  static getFavoriteData(): avMusicTemplate.FavoriteData {
    return {
      isSupportFav: true,
      isFavorite: true,
      favCounts: '99999+'
    }
  }

  static getCompilation(keyWord?: string): avMusicTemplate.Compilation {
    let topElements: avMusicTemplate.MediaEntity[] = [];
    topElements.push(FakerDataUtil.getMediaEntity('Element1'));
    topElements.push(FakerDataUtil.getMediaEntity('Element2'));
    let cId = 'id_12345';
    if (keyWord) {
      cId = keyWord as string;
    }
    let result: avMusicTemplate.Compilation = {
      errorCode: CommonConstants.SUCCESS_CODE,
      errorMsg: 'success',
      id: cId,
      title: 'title_aaaa',
      hasMoreData: true,
      totalSize: 2,
      memberMediaType: avMusicTemplate.EntityType.fromValue(1),
      topElements: topElements,
    }
    return result;

  }

  static getMediaTabContent(tabId: string): avMusicTemplate.MediaTabContent {
    let compilations: avMusicTemplate.Compilation[] = [];
    compilations.push(FakerDataUtil.getCompilation())
    return {
      errorCode: CommonConstants.SUCCESS_CODE,
      errorMsg: 'success',
      tabId: tabId,
      compilations: compilations,
    }
  }

  static getPageMediaEntity(pid: int, keyword?: string, searchType?: int): avMusicTemplate.PageMediaEntity {
    let episodeRange: avMusicTemplate.EpisodeRange = {
      start: 1, end: 4,
    }
    let errorMsg = 'success';
    if (searchType === undefined) {
      searchType = 1;
    }
    let errorCode = CommonConstants.SUCCESS_CODE;
    if (searchType < 0 || searchType > 7) {
      errorCode = -1;
      errorMsg = 'invalid search type'
    }

    return {
      errorCode: errorCode,
      errorMsg: errorMsg,
      pageIndex: pid,
      pageSize: 3,
      hasMoreData: true,
      totalSize: 4,
      memberMediaType: avMusicTemplate.EntityType.fromValue(searchType),
      elements: [FakerDataUtil.getMediaEntity()],
      sort: avMusicTemplate.Sort.fromValue(1),
      episodeRange: episodeRange,
    }
  }

  static getQueryMediaEntityParam(entityId: string): avMusicTemplate.QueryMediaEntityParam {
    let episodeRange: avMusicTemplate.EpisodeRange = {
      start: 1, end: 4,
    }
    return {
      entityId: entityId,
      pageIndex: 3,
      type: avMusicTemplate.EntityType.fromValue(2),
      subEntityType: avMusicTemplate.EntityType.fromValue(2),
      sort: avMusicTemplate.Sort.fromValue(1),
      episodeRange: episodeRange,
    }
  }

  static getPlayInfo(): avMusicTemplate.PlayInfo {
    return {
      playCounts: '100w',
      isSupportNext: true,
      isSupportPrev: true,
      isSupportQuickForward: true,
      isSupportQuickBackward: true,
      quickForwardStep: 15,
      quickBackwardStep: 15,
      isSupportSkipHead: true,
      isSupportSkipTail: true,
      isSupportPlayMode: true,
      isSupportPlayRate: true,
      supportedPlayRate: ['0.5', '1.0', '1.5'],
      currentPlayRate: '1.0',
      isSupportSoundQuality: true,
      isSupportSoundEffect: true,
      totalDuration: 201,
      currentPlayDuration: 50,
      isSupportProgress: true,
    }
  }

  static getFavSubscribeData(): avMusicTemplate.FavoriteData {
    return {
      isSupportFav: true,
      isFavorite: true,
      favCounts: '10000',
    }
  }

  static getSingle(isVip: boolean = true): avMusicTemplate.Single {
    let tag = 'ASingle';
    return {
      mediaId: `123456_${tag}`,
      mediaType: avMusicTemplate.EntityType.fromValue(1),
      parentId: `654321_${tag}`,
      parentMediaType: avMusicTemplate.EntityType.fromValue(1),
      title: `title_${tag}`,
      desc: `desc_${tag}`,
      imageUrl: `https://123test.${tag}.com`,
      playState: avMusicTemplate.PlaybackState.fromValue(1), // extents from MediaEntity
      isVip: isVip,
      singer: `singer_${tag}`,
      playInfo: FakerDataUtil.getPlayInfo(),
      favSubscribeData: FakerDataUtil.getFavSubscribeData(),
      tags: ['111', '2222'],
      settings: [FakerDataUtil.getSettingItem()],
      downloadStatus: avMusicTemplate.DownloadStatus.fromValue(1),
      downloadProgress: 50,
    }
  }

  static async getQrCodeInfo(loginType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo> {
    const cType = loginType as avMusicTemplate.LoginType;
    let qId = '123456';
    if (id) {
      qId = id as string;
    }
    return {
      id: qId,
      price: '1100',
      titleName: 'TitleName_1111',
      detailName: 'DetailName_111',
      tips: '6666666',
      icon: await FakerDataUtil.getPixelMap(),
      content: cType,
      codeData: await FakerDataUtil.getPixelMap(),
      validPeriod: 12,
    }
  }

  static async getPixelMap() {
    let color = new ArrayBuffer(96);
    let bufferArr = new Uint8Array(color);
    bufferArr.fill(3, 0, 95);
    let opts: image.InitializationOptions = {
      editable: true,
      pixelFormat: image.PixelMapFormat.fromValue(3),
      size: {
        height: 4, width: 6
      },
      alphaType: image.AlphaType.fromValue(3)
    };
    return image.createPixelMap(color, opts);
  }

  static getDialogActionInfo(): avMusicTemplate.DialogActionInfo {
    return {
      dialogId: 'DialogActionInfo_did_123456',
      isChecked: true,
      clickedBtnId: '12345678',
    }
  }

  static getDialogButtonInfo(): avMusicTemplate.DialogButtonInfo {
    return {
      buttonId: 'Bid123456',
      buttonText: 'A button',
      buttonType: avMusicTemplate.ButtonType.fromValue(1),
    }
  }

  static getSearchPlayMusicInfo(): avMusicTemplate.SearchPlayMusicInfo {
    return {
      items: [FakerDataUtil.getSearchPlayMusicItem()],
      displayName: 'you name',
      description: 'ha ahahda ',
      playMusicOnly: true,
      playMode: 'goggoo'
    }
  }

  static getSearchPlayMusicItem(): avMusicTemplate.SearchPlayMusicItem {
    return {
      entityId: '1231241',
      entityName: 'qwerasdfasdf'
    }
  }

  static getEpisodeRange(): avMusicTemplate.EpisodeRange {
    return {
      start: 100,
      end: 1000,
    }
}

  static getSearchPlayVideoInfo(): avMusicTemplate.SearchPlayVideoInfo {
    return {
      entityId: 'xxxx',
      episodeId: '122ew4223',
      episodeNumber: 1,
      extras: 'niashdfoasfwe'
    }

  }

  static async getDialogInfo(actionType?: avMusicTemplate.DialogActionType,
    actionInfo?: avMusicTemplate.DialogActionInfo) {
    const lType = 'queryLoginInfo' as avMusicTemplate.LoginType;
    let dialogId = 'DialogInfo_did_123456';
    if (actionInfo?.dialogId) {
      dialogId = actionInfo?.dialogId as string;
    }
    let res: avMusicTemplate.DialogInfo = {
      dialogId: dialogId,
      dialogType: avMusicTemplate.DialogType.fromValue(1),
      title: 'Title_adsfa',
      text: actionType || 'teaasdfgasdfa',
      buttons: [FakerDataUtil.getDialogButtonInfo()],
      qrCodes: [await FakerDataUtil.getQrCodeInfo(lType)],
      description: '23r123adfsasdf2342',
    }
    return res;
  }

  static async getMemberPurchaseInfo(mType?: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo> {
    mType = mType ?? avMusicTemplate.MemberPurchaseType.fromValue('normal');
    return {
      id: 'MemberPurchaseInfo_id_123456',
      diagramUrl: 'https://111.222.com',
      diagramData: await FakerDataUtil.getPixelMap(),
      diagramContent: 'sdfasdfasf2334asdfa',
      memberPurchaseType: mType!,
    }
  }

  static getUserInfo(): avMusicTemplate.UserInfo {
    return {
      userInfoId: 'UserInfoidxxx',
      nickName: 'wesddfs',
      profilePicUrl: 'https://123123.asdf.com',
      tips: 'dasfsffsdf',
      isLogin: true,
      isVip: true,
    }
  }

  static getSettingItem(): avMusicTemplate.SettingItem {
    return {
      id: 'settingItem2341234',
      title: 'tqweradf23',
      desc: '23safdasfawe234',
      settingType: avMusicTemplate.SettingType.fromValue(0),
      settingValue: true,
      mediaId: 'mid234123123'
    }
  }

  static async  getSettingContent(): Promise<avMusicTemplate.SettingContent> {
    return {
      value: 'test',
      isSelected: true,
      textTags: ['1111111', 'aaaa', 'bbbbbb'],
      imageTags: [await FakerDataUtil.getPixelMap()],
    }
  }

  static async getCustomElement(queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> {
    let res: avMusicTemplate.CustomElement = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: SUCCESS_MSG };
    if (queryType.indexOf('USER_INFO') >= 0) {
      res.userInfo = FakerDataUtil.getUserInfo();
    }
    if (queryType.indexOf('TAB') >= 0) {
      res.tabs = await FakerDataUtil.getMediaTabList();
    }
    if (queryType.indexOf('COMPILATION') >= 0) {
      res.customCompilations = [FakerDataUtil.getCompilation()];
    }
    if (queryType.indexOf('SETTINGS') >= 0) {
      res.settings = [FakerDataUtil.getSettingItem()];
    }
    return res;
  }

  static async getCustomElementEmpty(queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> {
    let res: avMusicTemplate.CustomElement = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: SUCCESS_MSG };
    if (queryType.indexOf('USER_INFO') >= 0) {
      res.userInfo = FakerDataUtil.getUserInfo();
    }
    if (queryType.indexOf('TAB') >= 0) {
      res.tabs = [];
    }
    if (queryType.indexOf('COMPILATION') >= 0) {
      res.customCompilations = [];
    }
    if (queryType.indexOf('SETTINGS') >= 0) {
      res.settings = [];
    }
    return res;
  }

  static getSearchPlayInfo(): avMusicTemplate.SearchPlayInfo {
    let res: avMusicTemplate.SearchPlayInfo = {
      musicInfo: FakerDataUtil.getSearchPlayMusicInfo(),
      videoInfo: FakerDataUtil.getSearchPlayVideoInfo(),
    };
    return res;
  }

  static async getWantAgent(): Promise<WantAgent> {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.abcd.hmos.carmusicdemo1",
          abilityName: "TestAbility",
          type: "action",
        }
      ],
      requestCode: 0
    };
    let wantAgentObj = await wantAgent.getWantAgent(wantAgentInfo);
    return wantAgentObj;
  }
}
