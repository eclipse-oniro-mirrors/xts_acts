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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { AVMusicTemplateUtil } from '../utils/AVMusicTemplateUtil.test';
import { CommonUtils } from '../utils/CommonUtil.test';
import { FakerDataUtil } from '../utils/FakerDataUtil.test';
import { CommonConstants } from '../constants/CommonConstants.test'
import { WantAgent } from '@ohos.wantAgent';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'avMusicTemplateTest';

export default function avMusicTemplateTest() {
  describe('ActsAVMusicTemplateTest', () => {
    let template: avMusicTemplate.AVMusicTemplate | undefined;
    let controller: avMusicTemplate.AVMusicTemplateController | undefined;

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
      template = AVMusicTemplateUtil.getTemplate();
      controller = AVMusicTemplateUtil.getController();
    })

    beforeEach(async () => {
      await CommonUtils.msSleep(200);
    })

    afterEach(async () => {
    })

    afterAll(async () => {
      await AVMusicTemplateUtil.destroy();
      await CommonUtils.msSleep(200);
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_0100
     * @tc.desc   Testing start template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res: avMusicTemplate.OperResult = await template!.startTemplate();
          CommonUtils.logInfo(TAG, `0100: ${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg).assertEqual('');
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "START_TEMPLATE_0100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_0200
     * @tc.desc   Testing on query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sTabs = await FakerDataUtil.getMediaTabList()
          template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
            return sTabs;
          });
          await CommonUtils.msSleep();
          let gTabs: avMusicTemplate.MediaTab[] = await controller!.queryMainTabs();
          expect(gTabs.length).assertEqual(3);
          expect(gTabs.length).assertEqual(sTabs.length);
          template!.offQueryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_MAIN_TABS_0200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_0300
     * @tc.desc   Testing off query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sTabs = await FakerDataUtil.getMediaTabList()
          template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
            return sTabs;
          });
          await CommonUtils.msSleep();
          template!.offQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
            expect(false).assertTrue();
            return sTabs;
          });
          // await CommonUtils.msSleep();
          // let gTabs: avMusicTemplate.MediaTab[] = await controller!.queryMainTabs(); // fixme off
          // expect(gTabs.length).assertEqual(0);
          // expect(gTabs.length).assertLess(sTabs.length);

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_MAIN_TABS_0300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_0400
     * @tc.desc   Testing on query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
          await CommonUtils.msSleep();
          let tabId = '123';
          let res: avMusicTemplate.MediaTabContent = await controller!.queryMediaTabContent(tabId);
          CommonUtils.logInfo(TAG, `0400: res=${JSON.stringify(res)}`)
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.tabId).assertEqual(tabId);
          template!.offQueryMediaTabContent();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_MEDIA_TAB_CONTENT_0400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_0500
     * @tc.desc   Testing off query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
          await CommonUtils.msSleep();
          let tabId = '123';
          let res: avMusicTemplate.MediaTabContent | undefined = await controller!.queryMediaTabContent(tabId);
          CommonUtils.logInfo(TAG, `0400: before off res=${JSON.stringify(res)}`)
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.tabId).assertEqual(tabId);
          // 执行off 后应该拿不到数据了
          res = undefined;
          template!.offQueryMediaTabContent();
          // await CommonUtils.msSleep();
          // res = await controller!.queryMediaTabContent(tabId); // fixme off
          // CommonUtils.logInfo(TAG, `0400:  after off res=${JSON.stringify(res)}`)
          expect(res).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_TAB_CONTENT_0500 catch err: " + CommonUtils.getError(err));
          expect(err.code).assertEqual(35000003);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_0600
     * @tc.desc   Testing on query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
          CommonUtils.msSleep();
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          CommonUtils.logInfo(TAG, `0600: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          template!.offQueryMediaEntity();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_0600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_0700
     * @tc.desc   Testing off query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return await FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
          CommonUtils.msSleep();
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity | undefined = await controller!.queryMediaEntity(params);
          CommonUtils.logInfo(TAG, `0600: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          res = undefined;
          template!.offQueryMediaEntity();
          // await CommonUtils.msSleep();
          // res = await controller!.queryMediaEntity(params);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_0700 catch err: " + CommonUtils.getError(err));
          expect(err.code).assertEqual(35000003);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_0800
     * @tc.desc   Testing on query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCompilation(async (cid: string, pid: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return await FakerDataUtil.getPageMediaEntity(pid);
          });
          CommonUtils.msSleep();
          let cid = '123456';
          let pid = 3;
          CommonUtils.logInfo(TAG, `0800: to query`);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          CommonUtils.logInfo(TAG, `0800: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          template!.offQueryCompilation();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_0800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_0900
     * @tc.desc   Testing off query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res: avMusicTemplate.PageMediaEntity | undefined = undefined;
          template!.onQueryCompilation(async (cid: string, pid: number): Promise<avMusicTemplate.PageMediaEntity> => {
            // use cid to find target
            return FakerDataUtil.getPageMediaEntity(pid);
          });
          CommonUtils.msSleep();
          let cid = '123456';
          let pid = 3;
          CommonUtils.logInfo(TAG, `0900: to query`);
          res = await controller!.queryCompilation(cid, pid);
          CommonUtils.logInfo(TAG, `0900: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          res = undefined;
          template!.offQueryCompilation();
          // CommonUtils.msSleep();
          // CommonUtils.logInfo(TAG, `0900: after off to query`);
          // res = await controller!.queryCompilation(cid, pid);
          // CommonUtils.logInfo(TAG, `0900:  after off res=${JSON.stringify(res)}`);
          expect(res).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_0900 catch err: " + CommonUtils.getError(err));
          expect(err.code).assertEqual(35000003);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_1000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_1000
     * @tc.desc   Testing on query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let tSort: number = 1;
          template!.onQueryPlaylist(async (pid: number,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            expect(sort).assertEqual(tSort)
            return FakerDataUtil.getPageMediaEntity(pid);
          });
          CommonUtils.msSleep();
          let pid = 3;
          CommonUtils.logInfo(TAG, `1000: to query`);
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryPlaylist(pid, tSort as avMusicTemplate.Sort);
          CommonUtils.logInfo(TAG, `1000: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          template!.offQueryPlaylist();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_PLAYLIST_1000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_1100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_1100
     * @tc.desc   Testing off query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let tSort: number = 1;
          template!.onQueryPlaylist(async (pid: number,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            expect(sort).assertEqual(tSort);
            return FakerDataUtil.getPageMediaEntity(pid);
          });
          CommonUtils.msSleep();
          let pid = 3;
          CommonUtils.logInfo(TAG, `1000: to query`);
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryPlaylist(pid, tSort as avMusicTemplate.Sort);
          CommonUtils.logInfo(TAG, `1000: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          // to off
          res = undefined;
          template!.offQueryPlaylist();
          // CommonUtils.msSleep();
          // CommonUtils.logInfo(TAG, `1000: after off to query`);
          // res = await controller!.queryPlaylist(pid, tSort as avMusicTemplate.Sort);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_PLAYLIST_1100 catch err: " + CommonUtils.getError(err));
          expect(err.code).assertEqual(35000003);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_1200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_1200
     * @tc.desc   Testing on query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let single = FakerDataUtil.getSingle();
          template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
            return single;
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Single = await controller!.queryCurrentSingle();
          expect(res!.mediaId).assertEqual(single.mediaId);
          template!.offQueryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_CURRENT_SINGLE_1200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_1300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_1300
     * @tc.desc   Testing off query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let single = FakerDataUtil.getSingle();
          template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
            return single;
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Single | undefined = await controller!.queryCurrentSingle();
          expect(res!.mediaId).assertEqual(single.mediaId);

          res = undefined;
          template!.offQueryCurrentSingle();
          // await CommonUtils.msSleep();
          // res = await controller!.queryCurrentSingle();
          expect(res).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_CURRENT_SINGLE_1300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_1400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_1400
     * @tc.desc   Testing on query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const keyword = 'KEY_WORD';
          template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
            return [FakerDataUtil.getCompilation(keyword)];
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          expect(res).not().assertUndefined();
          // expect(res!.length).assertEqual(0);
          expect(res!.length).assertEqual(1);
          let compilation: avMusicTemplate.Compilation = res![0];
          expect(compilation!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(compilation!.id).assertEqual(keyword);
          template!.offQueryCompilationByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_BY_KEYWORD_1400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_1500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_1500
     * @tc.desc   Testing off query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const keyword = 'KEY_WORD';
          template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
            return [FakerDataUtil.getCompilation(keyword)];
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          CommonUtils.logInfo(TAG, `1500: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          let compilation: avMusicTemplate.Compilation = res![0];
          expect(compilation!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(compilation!.id).assertEqual(keyword);

          res = undefined;
          template!.offQueryCompilationByKeyword();
          // CommonUtils.msSleep();
          // res = await controller!.queryCompilationByKeyword(keyword);
          // CommonUtils.logInfo(TAG, `1500:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_BY_KEYWORD_1500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_1600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_1600
     * @tc.desc   Testing on query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 1;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_1600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_1700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_1700
     * @tc.desc   Testing off query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 1;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          CommonUtils.logInfo(TAG, `1700: before off res=${JSON.stringify(res)}`);

          res = undefined;
          template!.offQueryMediaEntityByKeyword();
          // CommonUtils.msSleep();
          // res = await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          // CommonUtils.logInfo(TAG, `1700:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_1700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1800
     * @tc.desc   Testing on query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.MediaEntity[] | undefined = await controller!.queryRecommendMediaEntityList();
          expect(res!.length).assertLargerOrEqual(1);
          template!.offQueryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1900
     * @tc.desc   Testing off query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.MediaEntity[] | undefined = await controller!.queryRecommendMediaEntityList();
          CommonUtils.logInfo(TAG, `1900: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          res = undefined;
          template!.offQueryRecommendMediaEntityList();
          // await CommonUtils.msSleep();
          // res = await controller!.queryRecommendMediaEntityList();
          // CommonUtils.logInfo(TAG, `1900:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_1900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2000
     * @tc.desc   Testing on query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = ['111', '2222', '3333'];;
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] = await controller!.queryHotWords();
          CommonUtils.logInfo(TAG, `2000: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(3); // 非空覆盖
          expect(res!.length).assertEqual(data.length);
          template!.offQueryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_HOT_WORDS_2000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2001
     * @tc.desc   Testing on query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_2001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = [];;
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] = await controller!.queryHotWords();
          CommonUtils.logInfo(TAG, `2001: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(0); // 空覆盖
          template!.offQueryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_HOT_WORDS_2001 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_2100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_2100
     * @tc.desc   Testing off query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = ['111', '2222', '3333'];
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] | undefined = await controller!.queryHotWords();
          CommonUtils.logInfo(TAG, `2100: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertEqual(data.length);

          res = undefined;
          template!.offQueryHotWords();
          // await CommonUtils.msSleep();
          // res = await controller!.queryHotWords();
          // CommonUtils.logInfo(TAG, `2100:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_HOT_WORDS_2100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_2200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_2200
     * @tc.desc   Testing on query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = ['111', '2222', '3333'];
          template!.onQuerySearchHistory(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] | undefined = await controller!.querySearchHistory();
          CommonUtils.logInfo(TAG, `2200: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertEqual(data.length);
          template!.offQuerySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_SEARCH_HISTORY_2200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_2300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_2300
     * @tc.desc   Testing off query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {

          const data = ['111', '2222', '3333'];
          template!.onQuerySearchHistory(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] | undefined = await controller!.querySearchHistory();
          CommonUtils.logInfo(TAG, `2300: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertEqual(data.length);

          res = undefined;
          template!.offQuerySearchHistory();
          // await CommonUtils.msSleep();
          // res = await controller!.querySearchHistory();
          // CommonUtils.logInfo(TAG, `2300:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_SEARCH_HISTORY_2300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_2400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_2400
     * @tc.desc   Testing on clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.OperResult = await controller!.clearSearchHistory();
          CommonUtils.logInfo(TAG, `2400: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          // template!.offClearSearchHistory(); // todo
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CLEAR_SEARCH_HISTORY_2400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_2500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_2500
     * @tc.desc   Testing off clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.OperResult | undefined = await controller!.clearSearchHistory();
          CommonUtils.logInfo(TAG, `2500: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);

          res = undefined;
          template!.offClearSearchHistory();
          // await CommonUtils.msSleep();
          // res = await controller!.clearSearchHistory();
          // CommonUtils.logInfo(TAG, `2500: before off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CLEAR_SEARCH_HISTORY_2500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_2600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_2600
     * @tc.desc   Testing on login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
          await CommonUtils.msSleep();
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          CommonUtils.logInfo(TAG, `2600: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          expect(res[0].id).assertEqual(id);
          expect(res[0].content).assertEqual(logType);
          template!.offLogin();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_LOGIN_2600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_2700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_2700
     * @tc.desc   Testing off login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
          await CommonUtils.msSleep();
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] | undefined = await controller!.login(logType, id);
          CommonUtils.logInfo(TAG, `2700: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          expect(res![0].id).assertEqual(id);
          expect(res![0].content).assertEqual(logType);

          res = undefined;
          template!.offLogin();
          // await CommonUtils.msSleep();
          // res = await controller!.login(logType, id);
          // CommonUtils.logInfo(TAG, `2700:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_LOGIN_2700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_2800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_2800
     * @tc.desc   Testing on request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
          await CommonUtils.msSleep();
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          CommonUtils.logInfo(TAG, `2800: before off res=${JSON.stringify(res)}`);
          expect(res!.dialogId).assertEqual(actionInfo.dialogId);
          expect(res!.text).assertEqual(actionType);
          template!.offRequestDialogInfo();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_REQUEST_DIALOG_INFO_2800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_2900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_2900
     * @tc.desc   Testing off request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
          await CommonUtils.msSleep();
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          CommonUtils.logInfo(TAG, `2900: before off res=${JSON.stringify(res)}`);
          expect(res!.dialogId).assertEqual(actionInfo.dialogId);
          expect(res!.text).assertEqual(actionType);

          res = undefined;
          template!.offRequestDialogInfo();
          // await CommonUtils.msSleep();
          // res = await controller!.requestDialogInfo(actionType, actionInfo);
          // CommonUtils.logInfo(TAG, `2900:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_REQUEST_DIALOG_INFO_2900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_3000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_3000
     * @tc.desc   Testing on handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
            return dialogInfo;
          });
          await CommonUtils.msSleep();

          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          CommonUtils.logInfo(TAG, `3000: before off res=${JSON.stringify(res)}`);
          expect(res.dialogId).assertEqual(dialogInfo.dialogId);
          template!.offHandleMemberPurchase();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_HANDLE_MEMBER_PURCHASE_3000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_3100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_3100
     * @tc.desc   Testing off handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
            return dialogInfo;
          });
          await CommonUtils.msSleep();

          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          CommonUtils.logInfo(TAG, `3100: before off res=${JSON.stringify(res)}`);
          expect(res.dialogId).assertEqual(dialogInfo.dialogId);

          res = undefined;
          template!.offHandleMemberPurchase();
          // await CommonUtils.msSleep();
          // res = await controller!.handleMemberPurchase(info);
          // CommonUtils.logInfo(TAG, `3100:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_HANDLE_MEMBER_PURCHASE_3100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_3200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_3200
     * @tc.desc   Testing on query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
            let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
            CommonUtils.logInfo(TAG, `3200: data=${JSON.stringify(data)}`)
            return [data];
          });
          await CommonUtils.msSleep();
          const memberPurchaseType = 'normal' as avMusicTemplate.MemberPurchaseType;
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          CommonUtils.logInfo(TAG, `3200: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          expect(res![0].memberPurchaseType).assertEqual(memberPurchaseType);
          template!.offQueryMemberPurchase();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_MEMBER_PURCHASE_3200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_3300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_3300
     * @tc.desc   Testing off query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
            let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
            CommonUtils.logInfo(TAG, `3200: data=${JSON.stringify(data)}`)
            return [data];
          });
          await CommonUtils.msSleep();
          const memberPurchaseType = 'normal' as avMusicTemplate.MemberPurchaseType;
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          CommonUtils.logInfo(TAG, `3300: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          expect(res![0].memberPurchaseType).assertEqual(memberPurchaseType);

          res = undefined;
          template!.offQueryMemberPurchase();
          // await CommonUtils.msSleep();
          // res = await controller!.queryMemberPurchase(memberPurchaseType);
          // CommonUtils.logInfo(TAG, `3300:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_MEMBER_PURCHASE_3300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_3400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_3400
     * @tc.desc   Testing on query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
          await CommonUtils.msSleep();
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          CommonUtils.logInfo(TAG, `3400: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.userInfo).not().assertUndefined();
          expect(res!.tabs).not().assertUndefined();
          expect(res!.customCompilations).not().assertUndefined();
          expect(res!.settings).not().assertUndefined();
          template!.offQueryCustomContent();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_QUERY_CUSTOM_CONTENT_3400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_3500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_3500
     * @tc.desc   Testing off query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
          await CommonUtils.msSleep();
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          CommonUtils.logInfo(TAG, `3400: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.userInfo).not().assertUndefined();
          expect(res!.tabs).not().assertUndefined();
          expect(res!.customCompilations).not().assertUndefined();
          expect(res!.settings).not().assertUndefined();

          res = undefined;
          template!.offQueryCustomContent();
          // await CommonUtils.msSleep();
          // res = await controller!.queryCustomContent(queryType);
          // CommonUtils.logInfo(TAG, `3500:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_QUERY_CUSTOM_CONTENT_3500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_3500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_3500
     * @tc.desc   Testing on download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onDownloadMediaEntity(async (controlType: avMusicTemplate.DownloadControlType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            const cTypes = ['startDownload', 'deleteDownload', 'resumeDownload', 'pauseDownload'];
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (cTypes.indexOf(controlType) === -1) {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          CommonUtils.logInfo(TAG, `3500: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);

          res = await controller!.downloadMediaEntity('abcd3e' as avMusicTemplate.DownloadControlType, mediaEntity);
          CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3500: second the res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(-1);
          template!.offDownloadMediaEntity();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_3500 catch err: " + CommonUtils.getError(err));
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_3600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_3600
     * @tc.desc   Testing off download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onDownloadMediaEntity(async (controlType: avMusicTemplate.DownloadControlType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            const cTypes = ['startDownload', 'deleteDownload', 'resumeDownload', 'pauseDownload'];
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (cTypes.indexOf(controlType) === -1) {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          CommonUtils.logInfo(TAG, `3500: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);

          res = undefined;
          template!.offDownloadMediaEntity();
          // await CommonUtils.msSleep();
          // res = await controller!.downloadMediaEntity('startDownload', mediaEntity);
          // CommonUtils.logInfo(TAG, `3600:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_3600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_3700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_3700
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
          await CommonUtils.msSleep();
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          CommonUtils.logInfo(TAG, `3700: before off res=${JSON.stringify(res)}`);
          expect(res!.id).assertEqual(settingItem.id);
          template!.offSettingsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_3700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_3800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_3800
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
          await CommonUtils.msSleep();
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          CommonUtils.logInfo(TAG, `3800: before off res=${JSON.stringify(res)}`);
          expect(res!.id).assertEqual(settingItem.id);

          res = undefined;
          template!.offSettingsChange();
          // await CommonUtils.msSleep();
          // res = await controller!.updateSettings(settingItem);
          // CommonUtils.logInfo(TAG, `3800:  after off res=${JSON.stringify(res)}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_3800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_3900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_3900
     * @tc.desc   Testing on problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
          await CommonUtils.msSleep();
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          CommonUtils.logInfo(TAG, `3900: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual(advice);
          template!.offProblemAndAdvice();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PROBLEM_AND_ADVICE_3900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_4000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_4000
     * @tc.desc   Testing off problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
          await CommonUtils.msSleep();
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          CommonUtils.logInfo(TAG, `4000: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual(advice);

          res = undefined;
          template!.offProblemAndAdvice();
          // await CommonUtils.msSleep();
          // res = await controller!.reportProblemAndAdvice(advice);
          // CommonUtils.logInfo(TAG, `4000:  after off res=${JSON.stringify(res)}`);
          // expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PROBLEM_AND_ADVICE_4000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_4100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_4100
     * @tc.desc   Testing on play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
            if (command !== 'playMusic' && command !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          let command = 'playMusic' as avMusicTemplate.SearchPlayInfoType;
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res1: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `4100: res1=${JSON.stringify(res1)}`);
          expect(res1!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          command = 'abcdefg' as avMusicTemplate.SearchPlayInfoType;
          let res2: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `4100: res2=${JSON.stringify(res2)}`);
          expect(res2!.errorCode).assertEqual(-1);
          template!.offPlayForSearch();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAY_FOR_SEARCH_4100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_4200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_4200
     * @tc.desc   Testing off play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
            if (command !== 'playMusic' && command !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          let command = 'playMusic' as avMusicTemplate.SearchPlayInfoType;
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `4200: res1=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);

          res = undefined;
          template!.offPlayForSearch();
          // await CommonUtils.msSleep();
          // res = await controller!.playForSearch(command, args);
          // CommonUtils.logInfo(TAG, `4200:  after off res=${JSON.stringify(res)}`);
          // expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAY_FOR_SEARCH_4200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_4300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_4300
     * @tc.desc   Testing on execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
          await CommonUtils.msSleep();
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          CommonUtils.logInfo(TAG, `4300: before off res=${JSON.stringify(res)}`);
          expect(res).assertEqual(actionType + params);
          template!.offExecuteAction();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_EXECUTE_ACTION_4300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_4400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_4400
     * @tc.desc   Testing off execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
          await CommonUtils.msSleep();
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          CommonUtils.logInfo(TAG, `4400: before off res=${JSON.stringify(res)}`);
          expect(res).assertEqual(actionType + params);

          res = undefined;
          template!.offExecuteAction();
          // await CommonUtils.msSleep();
          // res = await controller!.executeAction(actionType, params);
          // CommonUtils.logInfo(TAG, `4400:  after off res=${JSON.stringify(res)}`);
          // expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_EXECUTE_ACTION_4400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_4500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_4500
     * @tc.desc   Testing on play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let sMediaEntity: avMusicTemplate.MediaEntity | undefined;
          template!.onPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {
            sMediaEntity = mediaEntity;
            // return FakerDataUtil.getOperResult(CommonConstants.SUCCESS_CODE);
          });
          await CommonUtils.msSleep();
          expect(sMediaEntity).assertUndefined();
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          expect(sMediaEntity).not().assertUndefined();
          expect(sMediaEntity!.mediaId).assertEqual(mediaEntity.mediaId)
          template!.offPlayMediaEntity();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAY_MEDIA_ENTITY_4500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_4600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_4600
     * @tc.desc   Testing off play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let sMediaEntity: avMusicTemplate.MediaEntity | undefined;
          template!.onPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {
            sMediaEntity = mediaEntity;
            // return FakerDataUtil.getOperResult(CommonConstants.SUCCESS_CODE);
          });
          await CommonUtils.msSleep();
          expect(sMediaEntity).assertUndefined();
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          expect(sMediaEntity).not().assertUndefined();
          expect(sMediaEntity!.mediaId).assertEqual(mediaEntity.mediaId)

          sMediaEntity = undefined;
          template!.offPlayMediaEntity();
          // await CommonUtils.msSleep();
          // await controller!.playMediaEntity(mediaEntity);
          // expect(sMediaEntity).assertUndefined();
          // expect(sMediaEntity!.mediaId).not().assertEqual(mediaEntity.mediaId)
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAY_MEDIA_ENTITY_4600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_4700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_4700
     * @tc.desc   Testing on favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          CommonUtils.logInfo(TAG, `4700:  first res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          actionType = 'aaaaa' as avMusicTemplate.MediaFavoriteType;
          res = await controller!.favoriteMediaEntity(actionType, mediaEntity);
          CommonUtils.logInfo(TAG, `4700: second res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(-1);
          template!.offFavoriteMediaEntity();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_FAVORITE_MEDIA_ENTITY_4700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_4800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_4800
     * @tc.desc   Testing off favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          CommonUtils.logInfo(TAG, `4800: before off res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);

          res = undefined;
          template!.offFavoriteMediaEntity();
          // await CommonUtils.msSleep();
          // res = await controller!.favoriteMediaEntity(actionType, mediaEntity);
          // CommonUtils.logInfo(TAG, `4800:  after off res=${JSON.stringify(res)}`);
          // expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_FAVORITE_MEDIA_ENTITY_4800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_4900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_4900
     * @tc.desc   Testing set user info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sUserInfo: avMusicTemplate.UserInfo | undefined;
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `4900: on userInfo=${JSON.stringify(userInfo)}`);
            sUserInfo = userInfo;
          })
          await CommonUtils.msSleep();
          const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
          expect(sUserInfo).assertUndefined();
          await template!.setUserInfo(userInfo);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4900: userInfo=${JSON.stringify(userInfo)}`);
          CommonUtils.logInfo(TAG, `4900: sUserInfo=${JSON.stringify(sUserInfo)}`);
          expect(sUserInfo).not().assertUndefined(); // fixme userInfoId与userId?
          expect(sUserInfo!.nickName).assertEqual(userInfo.nickName);
          controller!.offUserInfoChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_USER_INFO_4900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_5000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_5000
     * @tc.desc   Testing set dialog command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
            res = type + buttonInfo.dialogId;
            CommonUtils.logInfo(TAG, `5000: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
          await CommonUtils.msSleep();
          expect(res).assertEqual(dcType + dialogInfo.dialogId);
          controller!.offUserInfoChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_DIALOG_COMMAND_5000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_5100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_5100
     * @tc.desc   Testing set current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `5100: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
          await CommonUtils.msSleep();
          expect(res).assertEqual(data.mediaId);
          controller!.offCurrentSingleChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_CURRENT_SINGLE_5100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_5200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_5200
     * @tc.desc   Testing set media entities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
            let tem = ''
            mediaEntities.forEach((item) => {
              tem += item.mediaId;
            })
            res = tem;
            CommonUtils.logInfo(TAG, `5200: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getMediaEntity();
          await template!.setMediaEntities([data]);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          expect(res).assertEqual(data.mediaId);
          controller!.offMediaEntitiesChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_MEDIA_ENTITIES_5200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_5300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_5300
     * @tc.desc   Testing set tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res = '';
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
            res = tabId + tabContent.errorMsg;
            CommonUtils.logInfo(TAG, `5300: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const tabId = 'Tabid12335423';
          const tabContent = FakerDataUtil.getMediaTabContent(tabId);
          await template!.setTabContent(tabId, tabContent);
          await CommonUtils.msSleep();
          expect(res).assertEqual(tabId + tabContent.errorMsg);
          controller!.offTabContentChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_TAB_CONTENT_5300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_5400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_5400
     * @tc.desc   Testing set playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res = '';
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
            res = `${playlist.errorMsg}${playlist.errorCode}${playlist.pageIndex}`;
            CommonUtils.logInfo(TAG, `5400: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(2);
          await template!.setPlaylist(data);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          controller!.offPlaylistChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_PLAYLIST_5400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_5500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_5500
     * @tc.desc   Testing set download media entity status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `5500: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          expect(res).assertEqual(single.mediaId);
          controller!.offDownloadMediaEntityStatusChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_DOWNLOAD_MEDIA_ENTITY_STATUS_5500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_5600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_5600
     * @tc.desc   Testing set custom elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
            res = actionType + customType;
            CommonUtils.logInfo(TAG, `5600: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          const actionType = 'add' as avMusicTemplate.ActionType;
          const customType = 'USER_INFO' as avMusicTemplate.CustomType;
          const customElement = await FakerDataUtil.getCustomElement([customType])
          await template!.setCustomElements(actionType, customType, customElement);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          controller!.offCustomElementsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_CUSTOM_ELEMENTS_5600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_5700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_5700
     * @tc.desc   Testing set settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res = '';
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
            if (settingItems!.length) {
              res = settingItems[0].id;
            }
            CommonUtils.logInfo(TAG, `5700: on, res=${res}, len=${settingItems!.length}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `5700: before off res=${res}`);
          expect(res.length).assertLarger(0);
          controller!.offSettingsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_SETTINGS_5700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_5800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_5800
     * @tc.desc   Testing report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onReportExecuteAction((actionType: string, params: string) => {
            res = actionType + params;
            CommonUtils.logInfo(TAG, `5800: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `5800: before off res=${res}`);
          expect(res.length).assertLarger(0);
          // controller!.offReportExecuteAction(); // todo off
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_EXECUTE_ACTION_5800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_5900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_5900
     * @tc.desc   Testing set extension ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_5900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res: object | undefined = undefined;
          controller!.onExtensionAbilityChange((obj: object) => {
            expect(obj).not().assertUndefined();
            res = obj;
            CommonUtils.logInfo(TAG, `5900: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          let data = await FakerDataUtil.getWantAgent();
          template!.setExtensionAbility(data as WantAgent); // fixme
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `5900: before off res=${res}`);
          expect(res).not().assertUndefined();
          controller!.offExtensionAbilityChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "SET_EXTENSION_ABILITY_5900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_6000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_6000
     * @tc.desc   Testing destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template = AVMusicTemplateUtil.getTemplate();
          const beforeDestroyItems: avMusicTemplate.AVMusicTemplateDescriptor[] =
            avMusicTemplate.getAllAVMusicTemplateDescriptors();
          let templateExisted = false;
          let findTargetTemplate = (bundleName: string, items: avMusicTemplate.AVMusicTemplateDescriptor[]) => {
            for (let item of items) {
              if (item.bundleName == bundleName) {
                return true;
              }
            }
            return false;
          }
          templateExisted = findTargetTemplate(CommonConstants.BUNDLE_NAME, beforeDestroyItems);
          CommonUtils.logInfo(TAG, `6000: before destory templateExisted=${templateExisted}`);
          expect(templateExisted).assertTrue();
          templateExisted = false;
          try {
            await template.destroy();
          } catch (err) {
            expect(err!.code).assertEqual(801);
          }

          const afterDestroyItems: avMusicTemplate.AVMusicTemplateDescriptor[] =
            avMusicTemplate.getAllAVMusicTemplateDescriptors();
          templateExisted = findTargetTemplate(CommonConstants.BUNDLE_NAME, afterDestroyItems);
          CommonUtils.logInfo(TAG, `6000:  after destory templateExisted=${templateExisted}`);

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DESTROY_6000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_6111
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_6111
     * @tc.desc   Testing destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_6111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template = AVMusicTemplateUtil.getTemplate();
          CommonUtils.logInfo(TAG, `temp=${JSON.stringify(template)}`);
          await template.destroy();
          await AVMusicTemplateUtil.destroy();
          template.offQueryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DESTROY_THROWS_ERROR_6100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code)).assertEqual(35000005);
          done();
        }
      })
  })
}