/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avMusicTemplate from '@ohos.multimedia.avMusicTemplate';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { CommonUtils } from '../utils/CommonUtil.test';
import { FakerDataUtil } from '../utils/FakerDataUtil.test';
import { CommonConstants } from '../constants/CommonConstants.test';

const TAG = 'avMusicTemplateEntityTest';

export default function avMusicTemplateEntityTest() {
  describe('ActsAVMusicTemplateEntityTest', () => {

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
    })
    beforeEach(async () => {
    })
    afterEach(async () => {
    })
    afterAll(async () => {
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OPER_RESULT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OPER_RESULT_STATIC_0100
     * @tc.desc   Testing oper result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OPER_RESULT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.OperResult = FakerDataUtil.getOperResult();
          expect(data.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(data.errorMsg?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OPER_RESULT_0100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_STATIC_0200
     * @tc.desc   Testing media tab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.MediaTab = await FakerDataUtil.getMediaTab();
          expect(data.tabId.length).assertLarger(0);
          expect(data.tabName.length).assertLarger(0);
          expect(data.tabIcon).not().assertUndefined();
          expect(data.extraDataJson?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "MEDIA_TAB_0200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_CONTENT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_CONTENT_STATIC_0300
     * @tc.desc   Testing media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_TAB_CONTENT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.MediaTabContent = FakerDataUtil.getMediaTabContent('testxxx');
          expect(data.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(data.errorMsg?.length).assertLarger(0);
          expect(data.tabId.length).assertLarger(0);
          expect(data.compilations.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "MEDIA_TAB_CONTENT_0300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CUSTOM_ELEMENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CUSTOM_ELEMENT_STATIC_0400
     * @tc.desc   Testing custom element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CUSTOM_ELEMENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          const data: avMusicTemplate.CustomElement = await FakerDataUtil.getCustomElement(queryType);
          expect(data.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(data.errorMsg?.length).assertLarger(0);
          expect(data.userInfo).not().assertUndefined();
          expect(data.tabs?.length).assertLarger(0);
          expect(data.customCompilations?.length).assertLarger(0);
          expect(data.settings?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CUSTOM_ELEMENT_0400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_COMPILATION_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_COMPILATION_STATIC_0500
     * @tc.desc   Testing compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_COMPILATION_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.Compilation = FakerDataUtil.getCompilation();
          expect(data.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(data.errorMsg?.length).assertLarger(0);
          expect(data.id.length).assertLarger(0);
          expect(data.title.length).assertLarger(0);
          expect(data.hasMoreData).assertTrue();
          expect(data.totalSize).assertEqual(2);
          expect(data.memberMediaType).not().assertUndefined();
          expect(data.topElements.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "COMPILATION_0500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PAGE_MEDIA_ENTITY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PAGE_MEDIA_ENTITY_STATIC_0600
     * @tc.desc   Testing page media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PAGE_MEDIA_ENTITY_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(1, 'test', 2);
          expect(data.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(data.errorMsg?.length).assertLarger(0);
          expect(data.pageIndex).assertEqual(1);
          expect(data.pageSize).assertEqual(3);
          expect(data.hasMoreData).assertTrue();
          expect(data.totalSize).assertEqual(4);
          expect(data.memberMediaType).not().assertUndefined();
          expect(data.elements.length).assertEqual(1);
          expect(data.sort).assertEqual(1);
          expect(data.episodeRange).not().assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PAGE_MEDIA_ENTITY_0600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ENTITY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ENTITY_STATIC_0700
     * @tc.desc   Testing media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ENTITY_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.MediaEntity = FakerDataUtil.getMediaEntity();
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "MEDIA_ENTITY_0700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ELEMENT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ELEMENT_STATIC_0800
     * @tc.desc   Testing media element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEDIA_ELEMENT_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.MediaElement = FakerDataUtil.getMediaEntity() as avMusicTemplate.MediaElement;
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "MEDIA_ELEMENT_0800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_BANNER_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_BANNER_STATIC_0900
     * @tc.desc   Testing banner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_BANNER_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.Banner = FakerDataUtil.getBanner();
          expect(data.isSupportOnePlay).assertTrue();
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "BANNER_0900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ALBUM_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ALBUM_STATIC_1000
     * @tc.desc   Testing album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ALBUM_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.Album = FakerDataUtil.getAlbum();
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);

          expect(data.singer.length).assertLarger(0);
          expect(data.playCounts.length).assertLarger(0);
          expect(data.favSubscribeData).not().assertUndefined();
          expect(data.episodeCounts?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ALBUM_1000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SINGLE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SINGLE_STATIC_1100
     * @tc.desc   Testing single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SINGLE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.Single = FakerDataUtil.getSingle();
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);

          expect(data.isVip).assertTrue();
          expect(data.singer.length).assertLarger(0);
          expect(data.playInfo).not().assertUndefined();
          expect(data.favSubscribeData).not().assertUndefined();
          expect(data.tags?.length).assertLarger(0);
          expect(data.settings?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SINGLE_1100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_RANKING_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_RANKING_STATIC_1200
     * @tc.desc   Testing ranking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_RANKING_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.Ranking = FakerDataUtil.getRanking();
          expect(data.mediaId.length).assertLarger(0);
          expect(data.mediaType).assertEqual(1);
          expect(data.parentId.length).assertLarger(0);
          expect(data.parentMediaType).assertEqual(1);
          expect(data.title.length).assertLarger(0);
          expect(data.desc?.length).assertLarger(0);
          expect(data.imageUrl.length).assertLarger(0);
          expect(data.playState).assertEqual(1);
          expect(data.topElements.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "RANKING_1200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_INFO_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_INFO_STATIC_1300
     * @tc.desc   Testing play info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_INFO_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.PlayInfo = FakerDataUtil.getPlayInfo();
          expect(data.playCounts.length).assertLarger(2);
          expect(data.isSupportNext).assertTrue();
          expect(data.isSupportPrev).assertTrue();
          expect(data.isSupportQuickForward).assertTrue();
          expect(data.isSupportQuickBackward).assertTrue();
          expect(data.quickForwardStep).assertEqual(15);
          expect(data.quickBackwardStep).assertEqual(15);
          expect(data.isSupportSkipHead).assertTrue();
          expect(data.isSupportSkipTail).assertTrue();
          expect(data.isSupportPlayMode).assertTrue();
          expect(data.isSupportPlayRate).assertTrue();
          expect(data.supportedPlayRate.length).assertEqual(3);
          expect(data.currentPlayRate).assertEqual('1.0');
          expect(data.isSupportSoundQuality).assertTrue();
          expect(data.isSupportSoundEffect).assertTrue();
          expect(data.totalDuration).assertEqual(201);
          expect(data.currentPlayDuration).assertEqual(50);
          expect(data.isSupportProgress).assertTrue();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_INFO_1300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_DATA_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_DATA_STATIC_1400
     * @tc.desc   Testing favorite data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_DATA_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.FavoriteData = FakerDataUtil.getFavoriteData();
          expect(data.isSupportFav).assertTrue();
          expect(data.isFavorite).assertTrue();
          expect(data.favCounts.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_DATA_1400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_USER_INFO_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_USER_INFO_STATIC_1500
     * @tc.desc   Testing user info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_USER_INFO_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
          expect(data.userInfoId.length).assertLarger(0);
          expect(data.nickName.length).assertLarger(0);
          expect(data.profilePicUrl.length).assertLarger(0);
          expect(data.tips.length).assertLarger(0);
          expect(data.isLogin).assertTrue();
          expect(data.isVip).assertTrue();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "USER_INFO_1500 catch err: " + CommonUtils.getError(err));
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEMBER_PURCHASE_INFO_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEMBER_PURCHASE_INFO_STATIC_1600
     * @tc.desc   Testing member purchase info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_MEMBER_PURCHASE_INFO_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          expect(data.id.length).assertLarger(0);
          expect(data.diagramUrl.length).assertLarger(0);
          expect(data.diagramData).not().assertUndefined();
          expect(data.diagramContent.length).assertLarger(0);
          expect(data.memberPurchaseType).assertEqual('normal');
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "MEMBER_PURCHASE_INFO_1600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QR_CODE_INFO_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QR_CODE_INFO_STATIC_1700
     * @tc.desc   Testing qr code info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QR_CODE_INFO_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const logType = 'queryLoginInfo';
          const id = 'iiid'
          const data: avMusicTemplate.QrCodeInfo = await FakerDataUtil.getQrCodeInfo(logType, id);
          expect(data.id.length).assertEqual(id.length);
          expect(data.price.length).assertLarger(0);
          expect(data.titleName.length).assertLarger(0);
          expect(data.detailName.length).assertLarger(0);
          expect(data.tips.length).assertLarger(0);
          expect(data.icon).not().assertUndefined();
          expect(data.content.length).assertLarger(0);
          expect(data.codeData).not().assertUndefined();
          expect(data.validPeriod).assertEqual(12);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QR_CODE_INFO_1700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_ITEM_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_ITEM_STATIC_1800
     * @tc.desc   Testing setting item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_ITEM_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SettingItem = FakerDataUtil.getSettingItem();
          expect(data.id.length).assertLarger(0);
          expect(data.title.length).assertLarger(0);
          expect(data.desc.length).assertLarger(0);
          expect(data.settingType).assertEqual(0);
          expect(data.settingValue).assertTrue();
          expect(data.mediaId.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SETTING_ITEM_1800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_CONTENT_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_CONTENT_STATIC_1900
     * @tc.desc   Testing setting content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SETTING_CONTENT_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SettingContent = await FakerDataUtil.getSettingContent();
          expect(data.value.length).assertLarger(0);
          expect(data.isSelected).assertTrue();
          expect(data.textTags?.length).assertLarger(0);
          expect(data.imageTags).not().assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SETTING_CONTENT_1900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_ACTION_INFO_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_ACTION_INFO_STATIC_2000
     * @tc.desc   Testing dialog action info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_ACTION_INFO_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.DialogActionInfo = FakerDataUtil.getDialogActionInfo();
          expect(data.dialogId.length).assertLarger(0);
          expect(data.isChecked).assertTrue();
          expect(data.clickedBtnId.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DIALOG_ACTION_INFO_2000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_INFO_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_INFO_STATIC_2100
     * @tc.desc   Testing dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_INFO_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          expect(data.dialogId.length).assertLarger(0);
          expect(data.dialogType).assertEqual(1);
          expect(data.title?.length).assertLarger(0);
          expect(data.text?.length).assertLarger(0);
          expect(data.buttons?.length).assertLarger(0);
          expect(data.qrCodes?.length).assertLarger(0);
          expect(data.description?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DIALOG_INFO_2100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_BUTTON_INFO_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_BUTTON_INFO_STATIC_2200
     * @tc.desc   Testing dialog button info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DIALOG_BUTTON_INFO_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.DialogButtonInfo = FakerDataUtil.getDialogButtonInfo();
          expect(data.buttonId.length).assertLarger(0);
          expect(data.buttonText.length).assertLarger(0);
          expect(data.buttonType).assertEqual(1);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DIALOG_BUTTON_INFO_2200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_ITEM_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_ITEM_STATIC_2300
     * @tc.desc   Testing search play music item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_ITEM_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SearchPlayMusicItem = FakerDataUtil.getSearchPlayMusicItem();
          expect(data.entityId.length).assertLarger(0);
          expect(data.entityName?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SEARCH_PLAY_MUSIC_ITEM_2300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_INFO_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_INFO_STATIC_2400
     * @tc.desc   Testing search play music info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_MUSIC_INFO_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SearchPlayMusicInfo = FakerDataUtil.getSearchPlayMusicInfo();
          expect(data.items.length).assertLarger(0);
          expect(data.displayName?.length).assertLarger(0);
          expect(data.description?.length).assertLarger(0);
          expect(data.playMusicOnly).assertTrue();
          expect(data.playMode?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SEARCH_PLAY_MUSIC_INFO_2400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_VIDEO_INFO_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_VIDEO_INFO_STATIC_2500
     * @tc.desc   Testing search play video info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_VIDEO_INFO_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SearchPlayVideoInfo = FakerDataUtil.getSearchPlayVideoInfo();
          expect(data.entityId.length).assertLarger(0);
          expect(data.episodeId?.length).assertLarger(0);
          expect(data.episodeNumber).assertEqual(1);
          expect(data.extras?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SEARCH_PLAY_VIDEO_INFO_2500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_INFO_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_INFO_STATIC_2600
     * @tc.desc   Testing search play info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SEARCH_PLAY_INFO_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          expect(data.musicInfo).not().assertUndefined();
          expect(data.videoInfo).not().assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SEARCH_PLAY_INFO_2600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EPISODE_RANGE_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EPISODE_RANGE_STATIC_2700
     * @tc.desc   Testing episode range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EPISODE_RANGE_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const data: avMusicTemplate.EpisodeRange = FakerDataUtil.getEpisodeRange();
          expect(data.start).assertEqual(100);
          expect(data.end).assertEqual(1000);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "EPISODE_RANGE_2700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_PARAM_STATIC_0000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_PARAM_STATIC_0000
     * @tc.desc   Testing query media entity param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_PARAM_STATIC_0000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const entityId = '901231234';
          const data: avMusicTemplate.QueryMediaEntityParam = FakerDataUtil.getQueryMediaEntityParam(entityId);
          expect(data.entityId).assertEqual(entityId);
          expect(data.pageIndex).assertEqual(3);
          expect(data.type).assertEqual(2);
          expect(data.subEntityType).assertEqual(2);
          expect(data.sort).assertEqual(1);
          expect(data.episodeRange).not().assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_PARAM_0000 catch err: " + CommonUtils.getError(err));
        }
      })
  })
}