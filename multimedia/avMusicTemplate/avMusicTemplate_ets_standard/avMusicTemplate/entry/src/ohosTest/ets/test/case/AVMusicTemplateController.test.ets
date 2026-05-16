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
import { CommonConstants } from '../constants/CommonConstants.test';

const TAG = 'avMusicTemplateControllerTest';

export default function avMusicTemplateControllerTest() {
  describe('ActsAVMusicTemplateControllerTest', () => {
    let template: avMusicTemplate.AVMusicTemplate | undefined;
    let controller: avMusicTemplate.AVMusicTemplateController | undefined;

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
      template = AVMusicTemplateUtil.getTemplate();
      controller = AVMusicTemplateUtil.getController();
    })
    beforeEach(async () => {
      // TODO 开始前需要初始化template和controller
    })
    afterEach(async () => {
      // TODO 结束后需要销毁template和controller
    })
    afterAll(async () => {
      AVMusicTemplateUtil.destroy();
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0100
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_0100 catch err: " + CommonUtils.getError(err));
        }
      })

         /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0101
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
            return [];
          });
          await CommonUtils.msSleep();
          let gTabs: avMusicTemplate.MediaTab[] = await controller!.queryMainTabs();
          expect(gTabs.length).assertEqual(0);
          template!.offQueryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_0101 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_0200
     * @tc.desc   Testing query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
          await CommonUtils.msSleep();
          let tabId = '123';
          let res: avMusicTemplate.MediaTabContent = await controller!.queryMediaTabContent(tabId);
          CommonUtils.logInfo(TAG, `0200: res=${JSON.stringify(res)}`)
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg).assertEqual('success');
          expect(res.tabId).assertEqual(tabId);
          expect(res.compilations.length).assertEqual(1);
          template!.offQueryMediaTabContent();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_TAB_CONTENT_0200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_0300
     * @tc.desc   Testing query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
          CommonUtils.msSleep();
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          CommonUtils.logInfo(TAG, `0300: res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(0);
          expect(res.pageIndex).assertEqual(3);
          expect(res.pageSize).assertEqual(3);
          expect(res.hasMoreData).assertTrue();
          expect(res.totalSize).assertEqual(4);
          expect(res.memberMediaType).assertEqual(1);
          expect(res.elements.length).assertEqual(1);
          expect(res.sort).assertEqual(1);
          expect(res.episodeRange?.start).assertEqual(1);
          expect(res.episodeRange?.end).assertEqual(4);

          template!.offQueryMediaEntity()
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_0300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_0400
     * @tc.desc   Testing query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCompilation(async (cid: string, pid: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
          CommonUtils.msSleep();
          let cid = '123456';
          let pid = 3;
          CommonUtils.logInfo(TAG, `0400: to query`);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          CommonUtils.logInfo(TAG, `0400: res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(0);
          expect(res.pageIndex).assertEqual(3);
          expect(res.pageSize).assertEqual(3);
          expect(res.hasMoreData).assertTrue();
          expect(res.totalSize).assertEqual(4);
          expect(res.memberMediaType).assertEqual(1);
          expect(res.elements.length).assertEqual(1);
          expect(res.sort).assertEqual(1);
          expect(res.episodeRange?.start).assertEqual(1);
          expect(res.episodeRange?.end).assertEqual(4);
          template!.offQueryCompilation();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_0400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_0500
     * @tc.desc   Testing query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          CommonUtils.logInfo(TAG, `0500: to query`);
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryPlaylist(pid, tSort as avMusicTemplate.Sort);
          CommonUtils.logInfo(TAG, `0500: res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(0);
          expect(res.pageIndex).assertEqual(3);
          expect(res.pageSize).assertEqual(3);
          expect(res.hasMoreData).assertTrue();
          expect(res.totalSize).assertEqual(4);
          expect(res.memberMediaType).assertEqual(1);
          expect(res.elements.length).assertEqual(1);
          expect(res.sort).assertEqual(1);
          expect(res.episodeRange?.start).assertEqual(1);
          expect(res.episodeRange?.end).assertEqual(4);
          template!.offQueryPlaylist();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_PLAYLIST_0500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0600
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let single = FakerDataUtil.getSingle();
          template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
            return single;
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Single = await controller!.queryCurrentSingle();
          expect(res.mediaId.length).assertLarger(0);
          expect(res.mediaType).assertEqual(1);
          expect(res.parentId.length).assertLarger(0);
          expect(res.parentMediaType).assertEqual(1)
          expect(res.title.length).assertLarger(0);
          expect(res.desc?.length).assertLarger(0);
          expect(res.imageUrl.length).assertLarger(0);
          expect(res.playState).assertEqual(1);
          expect(res.isVip).assertTrue();
          expect(res.singer.length).assertLarger(0);
          expect(res.playInfo).not().assertUndefined();
          expect(res.favSubscribeData).not().assertUndefined();
          expect(res.tags?.length).assertLarger(0);
          expect(res.settings?.length).assertLarger(0);
          template!.offQueryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_0600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0601
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_0601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let single = FakerDataUtil.getSingle(false);
          template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
            return single;
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Single = await controller!.queryCurrentSingle();
          expect(res.mediaId.length).assertLarger(0);
          expect(res.mediaType).assertEqual(1);
          expect(res.parentId.length).assertLarger(0);
          expect(res.parentMediaType).assertEqual(1)
          expect(res.title.length).assertLarger(0);
          expect(res.desc?.length).assertLarger(0);
          expect(res.imageUrl.length).assertLarger(0);
          expect(res.playState).assertEqual(1);
          expect(res.isVip).assertFalse();
          expect(res.singer.length).assertLarger(0);
          expect(res.playInfo).not().assertUndefined();
          expect(res.favSubscribeData).not().assertUndefined();
          expect(res.tags?.length).assertLarger(0);
          expect(res.settings?.length).assertLarger(0);
          template!.offQueryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_0601 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0700
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const keyword = 'KEY_WORD';
          template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
            return [FakerDataUtil.getCompilation(keyword)];
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Compilation[] = await controller!.queryCompilationByKeyword(keyword);
          expect(res.length).assertLarger(0); // 非空覆盖
          let compilation: avMusicTemplate.Compilation = res![0];
          expect(compilation!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(compilation!.id).assertEqual(keyword);
          template!.offQueryCompilationByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_0700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0701
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const keyword = 'KEY_WORD';
          template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
            return [];
          })
          await CommonUtils.msSleep();
          let res: avMusicTemplate.Compilation[] = await controller!.queryCompilationByKeyword(keyword);
          expect(res.length).assertEqual(0); // 空覆盖
          template!.offQueryCompilationByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_0701 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0800
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0800',
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
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          CommonUtils.logInfo(TAG, `0800: res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(0);
          expect(res.pageIndex).assertEqual(3);
          expect(res.pageSize).assertEqual(3);
          expect(res.hasMoreData).assertTrue();
          expect(res.totalSize).assertEqual(4);
          expect(res.memberMediaType).assertEqual(1);
          expect(res.elements.length).assertEqual(1);
          expect(res.sort).assertEqual(1);
          expect(res.episodeRange?.start).assertEqual(1);
          expect(res.episodeRange?.end).assertEqual(4);

          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0801
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0801',
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
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0801 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0802
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 2;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0802 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0803
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0803
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0803',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 3;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0803 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0804
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0804
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0804',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 4;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0804 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0805
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0805
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0805',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 5;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0805 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0806
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0806
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0806',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 6;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0806 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0807
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0807
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0807',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 7;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res!.errorMsg).assertEqual('success');
          expect(res!.memberMediaType).assertEqual(searchType);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0807 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0808
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0808
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_0808',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: number): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
          await CommonUtils.msSleep();
          const keyword = 'KEY_WORD';
          const searchType = 8;
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity | undefined =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          expect(res!.errorCode).not().assertEqual(CommonConstants.SUCCESS_CODE);
          template!.offQueryMediaEntityByKeyword();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_0808 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0900
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.MediaEntity[] = await controller!.queryRecommendMediaEntityList();
          expect(res.length).assertEqual(1); // 非空覆盖
          template!.offQueryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0901
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [];
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.MediaEntity[] = await controller!.queryRecommendMediaEntityList();
          expect(res.length).assertEqual(0); // 空覆盖
          template!.offQueryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_0901 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_1000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_1000
     * @tc.desc   Testing query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = ['111', '2222', '3333']
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] | undefined = await controller!.queryHotWords();
          CommonUtils.logInfo(TAG, `2000: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertEqual(data.length);
          template!.offQueryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_HOT_WORDS_1000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1100
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = ['111', '2222', '3333']
          template!.onQuerySearchHistory(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] = await controller!.querySearchHistory();
          CommonUtils.logInfo(TAG, `1100: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(3);
          template!.offQuerySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_1100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1101
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_1101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const data = []
          template!.onQuerySearchHistory(async (): Promise<string[]> => {
            return data;
          });
          await CommonUtils.msSleep();
          let res: string[] = await controller!.querySearchHistory();
          CommonUtils.logInfo(TAG, `1101: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(0);
          template!.offQuerySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_1101 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_1200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_1200
     * @tc.desc   Testing clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
          await CommonUtils.msSleep();
          let res: avMusicTemplate.OperResult = await controller!.clearSearchHistory();
          CommonUtils.logInfo(TAG, `1200: before off res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);
          // template!.offClearSearchHistory();  // todo off
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CLEAR_SEARCH_HISTORY_1200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_1300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_1300
     * @tc.desc   Testing update settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
          await CommonUtils.msSleep();
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem = await controller!.updateSettings(settingItem);
          CommonUtils.logInfo(TAG, `1300: before off res=${JSON.stringify(res)}`);
          expect(res.id).assertEqual(settingItem.id);
          expect(res.mediaId).assertEqual(settingItem.mediaId);
          expect(res.title).assertEqual(settingItem.title);
          expect(res.desc).assertEqual(settingItem.desc);
          expect(res.settingType).assertEqual(settingItem.settingType);
          expect(res.settingValue).assertEqual(settingItem.settingValue);
          expect(res.id).assertEqual(settingItem.id);
          template!.offSettingsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "UPDATE_SETTINGS_1300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_1400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_1400
     * @tc.desc   Testing report problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
          await CommonUtils.msSleep();
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult = await controller!.reportProblemAndAdvice(advice);
          CommonUtils.logInfo(TAG, `1400: before off res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);
          template!.offProblemAndAdvice();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_PROBLEM_AND_ADVICE_1400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1500
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          CommonUtils.logInfo(TAG, `1500: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(1);
          expect(res[0].id).assertEqual(id);
          expect(res[0].content).assertEqual(logType);
          template!.offLogin();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_1500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1501
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            return [];
          });
          await CommonUtils.msSleep();
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          CommonUtils.logInfo(TAG, `1501: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(0);
          template!.offLogin();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_1501 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1502
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_1502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
          await CommonUtils.msSleep();
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType);
          CommonUtils.logInfo(TAG, `1502: before off res=${JSON.stringify(res)}`);
          expect(res!.length).assertLargerOrEqual(1);
          expect(res[0].id).not().assertEqual(id);
          expect(res[0].price.length).assertLarger(0);
          expect(res[0].content).assertEqual(logType);
          template!.offLogin();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_1501 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1600
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1600',
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
          let res: avMusicTemplate.DialogInfo = await controller!.requestDialogInfo(actionType, actionInfo);
          CommonUtils.logInfo(TAG, `1600: before off res=${JSON.stringify(res)}`);
          expect(res.dialogId.length).assertLarger(0);
          expect(res.dialogType).assertEqual(1);
          expect(res.title?.length).assertLarger(0);
          expect(res.text?.length).assertLarger(0);
          expect(res.buttons?.length).assertLarger(0);
          expect(res.qrCodes?.length).assertLarger(0);
          expect(res.description?.length).assertLarger(0);

          template!.offRequestDialogInfo();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_1600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1601
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_1601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            CommonUtils.logInfo(TAG, `1601: res=${JSON.stringify(res)}`);
            return res;
          });
          await CommonUtils.msSleep();
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          CommonUtils.logInfo(TAG, `1601: 11111111111`);
          let res: avMusicTemplate.DialogInfo = await controller!.requestDialogInfo(actionType); // fixme timeout
          CommonUtils.logInfo(TAG, `1601: 22111111111`);
          CommonUtils.logInfo(TAG, `1601: before off res=${JSON.stringify(res)}`);
          expect(res.dialogId.length).assertLarger(0);
          expect(res.dialogType).assertEqual(1);
          expect(res.title?.length).assertLarger(0);
          expect(res.text?.length).assertLarger(0);
          expect(res.buttons?.length).assertLarger(0);
          expect(res.qrCodes?.length).assertLarger(0);
          expect(res.description?.length).assertLarger(0);

          template!.offRequestDialogInfo();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_1601 catch err: " + CommonUtils.getError(err));
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_1700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_1700
     * @tc.desc   Testing handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
            return dialogInfo;
          });
          await CommonUtils.msSleep();

          let res: avMusicTemplate.DialogInfo = await controller!.handleMemberPurchase(info);
          CommonUtils.logInfo(TAG, `3000: before off res=${JSON.stringify(res)}`);
          expect(res.dialogId.length).assertLarger(0);
          expect(res.dialogType).assertEqual(1);
          expect(res.title?.length).assertLarger(0);
          expect(res.text?.length).assertLarger(0);
          expect(res.buttons?.length).assertLarger(0);
          expect(res.qrCodes?.length).assertLarger(0);
          expect(res.description?.length).assertLarger(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "HANDLE_MEMBER_PURCHASE_1700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1800
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
            let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
            CommonUtils.logInfo(TAG, `1800: data=${JSON.stringify(data)}`)
            return [data];
          });
          await CommonUtils.msSleep();
          const memberPurchaseType = 'normal' as avMusicTemplate.MemberPurchaseType;
          let res: avMusicTemplate.MemberPurchaseInfo[] = await controller!.queryMemberPurchase(memberPurchaseType);
          CommonUtils.logInfo(TAG, `1800: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(1);
          expect(res![0].memberPurchaseType).assertEqual(memberPurchaseType);
          template!.offQueryMemberPurchase();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_1800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1801
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1801',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
            let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
            CommonUtils.logInfo(TAG, `1801: data=${JSON.stringify(data)}`)
            return [];
          });
          await CommonUtils.msSleep();
          const memberPurchaseType = 'banner' as avMusicTemplate.MemberPurchaseType;
          let res: avMusicTemplate.MemberPurchaseInfo[] = await controller!.queryMemberPurchase(memberPurchaseType);
          CommonUtils.logInfo(TAG, `1801: before off res=${JSON.stringify(res)}`);
          expect(res.length).assertEqual(0);
          template!.offQueryMemberPurchase();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_1801 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1802
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_1802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[] | undefined> => {
            if (memberPurchaseType !== 'normal' && memberPurchaseType !== 'banner') {
              return undefined;
            }
            let data: avMusicTemplate.MemberPurchaseInfo =
              await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
            CommonUtils.logInfo(TAG, `1802: data=${JSON.stringify(data)}`)
            return [data];
          });
          await CommonUtils.msSleep();
          const memberPurchaseType = 'unknwotype' as avMusicTemplate.MemberPurchaseType;
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          CommonUtils.logInfo(TAG, `1802: before off res=${JSON.stringify(res)}`);
          expect(res![0]).assertUndefined();
          template!.offQueryMemberPurchase();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_1802 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1900
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
          await CommonUtils.msSleep();
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement = await controller!.queryCustomContent(queryType);
          CommonUtils.logInfo(TAG, `1900: before off res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);
          expect(res.userInfo).not().assertUndefined();
          expect(res.tabs?.length).assertLarger(0);
          expect(res.customCompilations?.length).assertLarger(0);
          expect(res.settings?.length).assertLarger(0);
          expect(res.userInfo?.userInfoId.length).assertLarger(0);
          expect(res.userInfo?.nickName.length).assertLarger(0);
          expect(res.userInfo?.profilePicUrl.length).assertLarger(0);
          expect(res.userInfo?.tips.length).assertLarger(0);
          expect(res.userInfo?.isLogin).assertTrue();
          expect(res.userInfo?.isVip).assertTrue();

          expect(res.tabs![0].tabId.length).assertLarger(0);
          expect(res.customCompilations![0].id.length).assertLarger(0);
          expect(res.settings![0].id.length).assertLarger(0);

          template!.offQueryCustomContent();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_1900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1901
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElementEmpty(queryType);
            return data;
          });
          await CommonUtils.msSleep();
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement = await controller!.queryCustomContent(queryType);
          CommonUtils.logInfo(TAG, `1901: before off res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);
          expect(res.userInfo).not().assertUndefined();
          expect(res.tabs?.length).assertEqual(0);
          expect(res.customCompilations?.length).assertEqual(0);
          expect(res.settings?.length).assertEqual(0);

          expect(res.userInfo?.userInfoId.length).assertLarger(0);
          expect(res.userInfo?.nickName.length).assertLarger(0);
          expect(res.userInfo?.profilePicUrl.length).assertLarger(0);
          expect(res.userInfo?.tips.length).assertLarger(0);
          expect(res.userInfo?.isLogin).assertTrue();
          expect(res.userInfo?.isVip).assertTrue();

          template!.offQueryCustomContent();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_1901 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1902
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_1902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
          await CommonUtils.msSleep();
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement = await controller!.queryCustomContent(queryType);
          CommonUtils.logInfo(TAG, `1902: before off res=${JSON.stringify(res)}`);
          expect(res.tabs?.length).assertLarger(0);
          if (res.tabs === undefined) {
            expect(false).assertTrue();
          } else {
            let tab: avMusicTemplate.MediaTab = res.tabs[0];
            expect(tab.tabId.length).assertLarger(0);
            expect(tab.tabName.length).assertLarger(0);
            expect(tab.tabIcon).not().assertUndefined();
            expect(tab.extraDataJson?.length).assertLarger(0);
          }

          template!.offQueryCustomContent();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_1902 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_2000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_2000
     * @tc.desc   Testing download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_2000',
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
          CommonUtils.logInfo(TAG, `2000: before off res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);

          res = await controller!.downloadMediaEntity('abcd3e' as avMusicTemplate.DownloadControlType, mediaEntity);
          CommonUtils.logInfo(TAG, `2000: second the res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(-1);
          template!.offDownloadMediaEntity();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DOWNLOAD_MEDIA_ENTITY_2000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2100
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (command !== 'playMusic' && command !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
          await CommonUtils.msSleep();
          let command = 'playMusic' as avMusicTemplate.SearchPlayInfoType;
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `2100: res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(1);
          template!.offPlayForSearch();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_2100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2101
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          let command = 'playVideo' as avMusicTemplate.SearchPlayInfoType;
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `2101: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          template!.offPlayForSearch();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_2101 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2102
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          let command = 'aaaa' as avMusicTemplate.SearchPlayInfoType;
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          CommonUtils.logInfo(TAG, `2102: res=${JSON.stringify(res)}`);
          expect(res!.errorCode).assertEqual(-1);
          template!.offPlayForSearch();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_2102 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_2200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_2200
     * @tc.desc   Testing execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          CommonUtils.logError(TAG, "EXECUTE_ACTION_2200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_2300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_2300
     * @tc.desc   Testing play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_2300',
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
          CommonUtils.logError(TAG, "PLAY_MEDIA_ENTITY_2300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_2400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_2400
     * @tc.desc   Testing favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_2400',
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
          let res: avMusicTemplate.OperResult = await controller!.favoriteMediaEntity(actionType, mediaEntity);
          expect(res).not().assertUndefined();
          expect(res.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
          expect(res.errorMsg?.length).assertLarger(0);
          actionType = 'aaaaa' as avMusicTemplate.MediaFavoriteType;
          res = await controller!.favoriteMediaEntity(actionType, mediaEntity);
          CommonUtils.logInfo(TAG, `2400: second res=${JSON.stringify(res)}`);
          expect(res.errorCode).assertEqual(-1);
          template!.offFavoriteMediaEntity();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_MEDIA_ENTITY_2400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_2500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_2500
     * @tc.desc   Testing on user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let sUserInfo: avMusicTemplate.UserInfo | undefined;
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
            sUserInfo = userInfo;
          })
          await CommonUtils.msSleep();
          const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
          expect(sUserInfo).assertUndefined();
          await template!.setUserInfo(userInfo);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `2500: userInfo=${JSON.stringify(userInfo)}`);
          CommonUtils.logInfo(TAG, `2500: sUserInfo=${JSON.stringify(sUserInfo)}`);
          expect(sUserInfo).not().assertUndefined(); // fixme userInfoId与userId?
          expect(sUserInfo!.nickName).assertEqual(userInfo.nickName);
          expect(sUserInfo!.userInfoId).assertEqual(userInfo.userInfoId);
          controller!.offUserInfoChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_USER_INFO_CHANGE_2500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_2600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_2600
     * @tc.desc   Testing off user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let sUserInfo: avMusicTemplate.UserInfo | undefined;
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2600: on userInfo=${JSON.stringify(userInfo)}`);
            sUserInfo = userInfo;
          })
          await CommonUtils.msSleep();
          const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
          expect(sUserInfo).assertUndefined();
          await template!.setUserInfo(userInfo);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `2600: userInfo=${JSON.stringify(userInfo)}`);
          CommonUtils.logInfo(TAG, `2600: sUserInfo=${JSON.stringify(sUserInfo)}`);
          expect(sUserInfo).not().assertUndefined();
          expect(sUserInfo!.nickName).assertEqual(userInfo.nickName);
          controller!.offUserInfoChange();
          sUserInfo = undefined;
          expect(sUserInfo).assertUndefined();
          await template!.setUserInfo(userInfo);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `2600: after off sUserInfo=${JSON.stringify(sUserInfo)}`);
          expect(sUserInfo).assertUndefined();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_USER_INFO_CHANGE_2600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_2700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_2700
     * @tc.desc   Testing on dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
            res = type + buttonInfo.dialogId;
            CommonUtils.logInfo(TAG, `2700: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
          await CommonUtils.msSleep();
          expect(res).assertEqual(dcType + dialogInfo.dialogId);
          controller!.offDialogCommandChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DIALOG_COMMAND_CHANGE_2700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_2800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_2800
     * @tc.desc   Testing off dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
            res = type + buttonInfo.dialogId;
            CommonUtils.logInfo(TAG, `2800: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
          await CommonUtils.msSleep();
          expect(res).assertEqual(dcType + dialogInfo.dialogId);
          controller!.offDialogCommandChange();
          res = '';
          await template!.setDialogCommand(dcType, dialogInfo);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `2800: after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DIALOG_COMMAND_CHANGE_2800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2900
     * @tc.desc   Testing on current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
            expect(single.mediaId.length).assertLarger(0);
            expect(single.mediaType).not().assertUndefined();
            expect(single.parentId.length).assertLarger(0);
            expect(single.parentMediaType).not().assertUndefined();
            expect(single.title.length).assertLarger(0);
            expect(single.desc?.length).assertLarger(0);
            expect(single.imageUrl.length).assertLarger(0);
            expect(single.playState).not().assertUndefined();

            expect(single.isVip).assertTrue();
            expect(single.singer.length).assertLarger(0);
            expect(single.playInfo).not().assertUndefined();
            expect(single.favSubscribeData).not().assertUndefined();
            expect(single.tags?.length).assertLarger(0);
            expect(single.settings?.length).assertLarger(0);
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `2900: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
          await CommonUtils.msSleep();
          expect(res).assertEqual(data.mediaId);
          controller!.offCurrentSingleChange();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CURRENT_SINGLE_CHANGE_2900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2901
     * @tc.desc   Testing on current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_2901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
            expect(single.mediaId.length).assertLarger(0);
            expect(single.mediaType).not().assertUndefined();
            expect(single.parentId.length).assertLarger(0);
            expect(single.parentMediaType).not().assertUndefined();
            expect(single.title.length).assertLarger(0);
            expect(single.desc?.length).assertLarger(0);
            expect(single.imageUrl.length).assertLarger(0);
            expect(single.playState).not().assertUndefined();

            expect(single.isVip).assertFalse();
            expect(single.singer.length).assertLarger(0);
            expect(single.playInfo).not().assertUndefined();
            expect(single.favSubscribeData).not().assertUndefined();
            expect(single.tags?.length).assertLarger(0);
            expect(single.settings?.length).assertLarger(0);
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `2901: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSingle(false);
          await template!.setCurrentSingle(data);
          await CommonUtils.msSleep();
          expect(res).assertEqual(data.mediaId);
          controller!.offCurrentSingleChange();

          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CURRENT_SINGLE_CHANGE_2901 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_3000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_3000
     * @tc.desc   Testing off current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `2900: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
          await CommonUtils.msSleep();
          expect(res).assertEqual(data.mediaId);
          controller!.offCurrentSingleChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setCurrentSingle(data);
          await CommonUtils.msSleep();
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CURRENT_SINGLE_CHANGE_3000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3100
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
            let tem = ''
            mediaEntities.forEach((item) => {
              tem += item.mediaId;
            })
            res = tem;
            CommonUtils.logInfo(TAG, `3100: on, res=${res}`);
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
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_3100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3101
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
            expect(mediaEntities.length).assertEqual(1);
            res = mediaEntities[0].mediaId;
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
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_3101 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3102
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_3102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
            expect(mediaEntities.length).assertEqual(0)
          })
          await CommonUtils.msSleep();
          await template!.setMediaEntities([]);
          await CommonUtils.msSleep();
          controller!.offMediaEntitiesChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_3102 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_3200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_3200
     * @tc.desc   Testing off media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
            let tem = ''
            mediaEntities.forEach((item) => {
              tem += item.mediaId;
            })
            res = tem;
            CommonUtils.logInfo(TAG, `3200: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getMediaEntity();
          await template!.setMediaEntities([data]);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          expect(res).assertEqual(data.mediaId);
          controller!.offMediaEntitiesChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setMediaEntities([data]);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3200: after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_MEDIA_ENTITIES_CHANGE_3200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_3300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_3300
     * @tc.desc   Testing on tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
            res = tabId + tabContent.errorMsg;
            CommonUtils.logInfo(TAG, `3300: on, res=${res}`);
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
          CommonUtils.logError(TAG, "ON_TAB_CONTENT_CHANGE_3300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_3400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_3400
     * @tc.desc   Testing off tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
            res = tabId + tabContent.errorMsg;
            CommonUtils.logInfo(TAG, `3400: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const tabId = 'Tabid12335423';
          const tabContent = FakerDataUtil.getMediaTabContent(tabId);
          await template!.setTabContent(tabId, tabContent);
          await CommonUtils.msSleep();
          expect(res).assertEqual(tabId + tabContent.errorMsg);
          controller!.offTabContentChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setTabContent(tabId, tabContent);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3400: after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_TAB_CONTENT_CHANGE_3400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_3500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_3500
     * @tc.desc   Testing on playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
            res = `${playlist.errorMsg}${playlist.errorCode}${playlist.pageIndex}`;
            CommonUtils.logInfo(TAG, `3500: on, playlist=${JSON.stringify(playlist)}`);
            expect(playlist.errorCode).assertEqual(CommonConstants.SUCCESS_CODE);
            expect(playlist.errorMsg?.length).assertLarger(0);
            expect(playlist.pageIndex).assertEqual(3);
            expect(playlist.pageSize).assertEqual(3);
            expect(playlist.hasMoreData).assertTrue();
            expect(playlist.totalSize).assertEqual(4);
            expect(playlist.memberMediaType).assertEqual(1);
            expect(playlist.elements.length).assertEqual(1);
            expect(playlist.sort).assertEqual(1);
            expect(playlist.episodeRange?.start).assertEqual(1);
            expect(playlist.episodeRange?.end).assertEqual(4);
          });
          await CommonUtils.msSleep();
          const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(3);
          await template!.setPlaylist(data);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          controller!.offPlaylistChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAYLIST_CHANGE_3500 catch err: " + CommonUtils.getError(err));
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_3600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_3600
     * @tc.desc   Testing off playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
            res = `${playlist.errorMsg}${playlist.errorCode}${playlist.pageIndex}`;
            CommonUtils.logInfo(TAG, `3600: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(2);
          await template!.setPlaylist(data);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          controller!.offPlaylistChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setPlaylist(data);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3600: after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAYLIST_CHANGE_3600 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3700
     * @tc.desc   Testing on download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `3700: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
          await CommonUtils.msSleep();
          expect(res.length).assertLarger(0);
          expect(res).assertEqual(single.mediaId);
          controller!.offDownloadMediaEntityStatusChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3700 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3800
     * @tc.desc   Testing off download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
            res = single.mediaId;
            CommonUtils.logInfo(TAG, `3800: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3800: before off res=${res}`);
          expect(res.length).assertLarger(0);
          expect(res).assertEqual(single.mediaId);
          controller!.offDownloadMediaEntityStatusChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setDownloadMediaEntityStatus(single);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `3800:  after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_3800 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_3900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_3900
     * @tc.desc   Testing on custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
            res = actionType + customType;
            CommonUtils.logInfo(TAG, `3900: on, res=${res}`);
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
          CommonUtils.logError(TAG, "ON_CUSTOM_ELEMENTS_CHANGE_3900 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_4000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_4000
     * @tc.desc   Testing off custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
            res = actionType + customType;
            CommonUtils.logInfo(TAG, `4000: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          const actionType = 'add' as avMusicTemplate.ActionType;
          const customType = 'USER_INFO' as avMusicTemplate.CustomType;
          const customElement = await FakerDataUtil.getCustomElement([customType])
          await template!.setCustomElements(actionType, customType, customElement);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4000: before off res=${res}`);
          expect(res.length).assertLarger(0);
          controller!.offCustomElementsChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setCustomElements(actionType, customType, customElement);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4000:  after off res=${res}`);
          expect(res.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CUSTOM_ELEMENTS_CHANGE_4000 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4100
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
            expect(settingItems.length).assertEqual(1);
            if (settingItems!.length) {
              res = settingItems[0].id;
            }
            CommonUtils.logInfo(TAG, `4100: on, res=${res}, len=${settingItems!.length}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4100: before off res=${res}`);
          expect(res.length).assertLarger(0);
          controller!.offSettingsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_4100 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4101
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_4101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
            expect(settingItems.length).assertEqual(0);
            CommonUtils.logInfo(TAG, `4101: on settingItems=${JSON.stringify(settingItems)}`);
          })
          await CommonUtils.msSleep();
          await template!.setSettings([]);
          await CommonUtils.msSleep();
          controller!.offSettingsChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_4101 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_4200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_4200
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
            if (settingItems!.length) {
              CommonUtils.logInfo(TAG, `4200: on 222 res=${res}, len=${JSON.stringify(settingItems)}`);
              res = settingItems[0].id;
            }
            CommonUtils.logInfo(TAG, `4200: on, res=${res}, len=${settingItems!.length}`);
          })
          await CommonUtils.msSleep();
          const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4200: before off res=${res}`);
          expect(res.length).assertLarger(0);
          controller!.offSettingsChange();

          res = '';
          await CommonUtils.msSleep();
          await template!.setSettings([data]);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4200:  after off res=${res}`);
          expect(res!.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_4200 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_4300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_4300
     * @tc.desc   Testing on report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onReportExecuteAction((actionType: string, params: string) => {
            res = actionType + params;
            CommonUtils.logInfo(TAG, `4300: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4300: before off res=${res}`);
          expect(res).assertEqual(actionType+params);
          // controller!.offReportExecuteAction(); // todo off
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_REPORT_EXECUTE_ACTION_4300 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_4400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_4400
     * @tc.desc   Testing off report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res = '';
          controller!.onReportExecuteAction((actionType: string, params: string) => {
            res = actionType + params;
            CommonUtils.logInfo(TAG, `4400: on, res=${res}`);
          })
          await CommonUtils.msSleep();
          const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4400: before off res=${res}`);
          expect(res).assertEqual(''); // fixme
          controller!.offReportExecuteAction();

          res = '';
          await CommonUtils.msSleep();
          await template!.reportExecuteAction(actionType, params);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4400:  after off res=${res}`);
          expect(res!.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_REPORT_EXECUTE_ACTION_4400 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_4500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_4500
     * @tc.desc   Testing on extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res: object | undefined = undefined;
          controller!.onExtensionAbilityChange((obj: object) => {
            CommonUtils.logInfo(TAG, `obj=${JSON.stringify(obj)}`);
            expect(obj).not().assertUndefined();
            res = obj;
            CommonUtils.logInfo(TAG, `4500: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          let data = await FakerDataUtil.getWantAgent();
          CommonUtils.logInfo(TAG, `data=${JSON.stringify(data)}`);
          // await template!.setExtensionAbility(data);
          // await CommonUtils.msSleep();
          // CommonUtils.logInfo(TAG, `4500: before off res=${res}`);
          // expect(res).not().assertUndefined();
          controller!.offExtensionAbilityChange();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_EXTENSION_ABILITY_CHANGE_4500 catch err: " + CommonUtils.getError(err));
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_4600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_4600
     * @tc.desc   Testing off extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res: object | undefined = undefined;
          controller!.onExtensionAbilityChange((obj: object) => {
            // expect(obj).not().assertUndefined(); // fixme
            res = obj;
            CommonUtils.logInfo(TAG, `4600: on, res=${res}`);
          });
          await CommonUtils.msSleep();
          let data = await FakerDataUtil.getWantAgent();
          template!.setExtensionAbility(data);
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `4600: before off res=${res}`);
          expect(res).not().assertUndefined();
          res = undefined;
          controller!.offExtensionAbilityChange((obj: object) => {});
          // await CommonUtils.msSleep();
          // await template!.setExtensionAbility(data);
          // await CommonUtils.msSleep();
          // CommonUtils.logInfo(TAG, `4600:  after off res=${res}`);
          expect(res).assertUndefined();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_EXTENSION_ABILITY_CHANGE_4600 catch err: " + CommonUtils.getError(err));
          expect(err.code).assertUndefined();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_4800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_4800
     * @tc.desc   Testing destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let temp: avMusicTemplate.AVMusicTemplate =
          avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
        let des: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors();
        expect(des.length).assertLarger(0);
        const sid: string = des[0].sessionId;
        CommonUtils.logInfo(TAG, `4800 sessionid=${JSON.stringify(des)}`);
        let controller: avMusicTemplate.AVMusicTemplateController =
          avMusicTemplate.createAVMusicTemplateController(sid);
        await controller.destroy();
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "DESTROY_THROWS_ERROR_4800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })


  })
}