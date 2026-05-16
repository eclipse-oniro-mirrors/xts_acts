/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { AVMusicTemplateUtil } from '../utils/AVMusicTemplateUtil.test';
import { CommonUtils } from '../utils/CommonUtil.test';
import { FakerDataUtil } from '../utils/FakerDataUtil.test';

const TAG = 'avMusicTemplateControllerThrowsErrorTest';

export default function avMusicTemplateControllerThrowsErrorTest() {
  describe('ActsAVMusicTemplateControllerThrowsErrorTest', () => {
    let template: avMusicTemplate.AVMusicTemplate | undefined;
    let controller: avMusicTemplate.AVMusicTemplateController | undefined;

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
      template = AVMusicTemplateUtil.getTemplate();
      controller = AVMusicTemplateUtil.getController();
      CommonUtils.msSleep(600);
    })

    beforeEach(async () => {

    })

    afterEach(async () => {

    })

    afterAll(async () => {
      AVMusicTemplateUtil.destroy();
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0100
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryMainTabs();
          expect().assertFail();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_THROWS_ERROR_0100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0101
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_THROWS_ERROR_0101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0102
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_THROWS_ERROR_0102 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0103
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0103
     * @tc.desc   Testing query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryMainTabs();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MAIN_TABS_THROWS_ERROR_0103 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0200
     * @tc.desc   Testing query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tabId = '123';
          await controller!.queryMediaTabContent(tabId);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0201
     * @tc.desc   Testing query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tabId = '123';
          await controller!.queryMediaTabContent(tabId);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0202
     * @tc.desc   Testing query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tabId = '123';
          await controller!.queryMediaTabContent(tabId);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0203
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0203
     * @tc.desc   Testing query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tabId = '123';
          await controller!.queryMediaTabContent(tabId);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0203 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0300
     * @tc.desc   Testing query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_THROWS_ERROR_0300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0301
     * @tc.desc   Testing query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_THROWS_ERROR_0301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0302
     * @tc.desc   Testing query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_THROWS_ERROR_0302 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0303
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0303
     * @tc.desc   Testing query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let eid = '123456';
          let params = FakerDataUtil.getQueryMediaEntityParam(eid);
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryMediaEntity(params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_THROWS_ERROR_0303 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0400
     * @tc.desc   Testing query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let cid = '123456';
          let pid = 3;
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_THROWS_ERROR_0400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0401
     * @tc.desc   Testing query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let cid = '123456';
          let pid = 3;
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_THROWS_ERROR_0401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0402
     * @tc.desc   Testing query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let cid = '123456';
          let pid = 3;
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_THROWS_ERROR_0402 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0403
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0403
     * @tc.desc   Testing query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_THROWS_ERROR_STATIC_0403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let cid = '123456';
          let pid = 3;
          let res: avMusicTemplate.PageMediaEntity = await controller!.queryCompilation(cid, pid);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_THROWS_ERROR_0403 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0500
     * @tc.desc   Testing query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tSort: int = 1;
          let pid = 3;
          await controller!.queryPlaylist(pid, avMusicTemplate.Sort.fromValue(tSort));
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_PLAYLIST_THROWS_ERROR_0500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0501
     * @tc.desc   Testing query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tSort: int = 1;
          let pid = 3;
          await controller!.queryPlaylist(pid, avMusicTemplate.Sort.fromValue(tSort));
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_PLAYLIST_THROWS_ERROR_0501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0502
     * @tc.desc   Testing query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tSort: int = 1;
          let pid = 3;
          await controller!.queryPlaylist(pid, avMusicTemplate.Sort.fromValue(tSort));
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_PLAYLIST_THROWS_ERROR_0502 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0503
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0503
     * @tc.desc   Testing query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_PLAYLIST_THROWS_ERROR_STATIC_0503',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let tSort: int = 1;
          let pid = 3;
          await controller!.queryPlaylist(pid, avMusicTemplate.Sort.fromValue(tSort));
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_PLAYLIST_THROWS_ERROR_0503 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0600
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_THROWS_ERROR_0600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0601
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_THROWS_ERROR_0601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0602
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0602',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_THROWS_ERROR_0602 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0603
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0603
     * @tc.desc   Testing query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_0603',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await controller!.queryCurrentSingle();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CURRENT_SINGLE_THROWS_ERROR_0603 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0700
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_0700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0701
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_0701 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0702
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0702',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_0702 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0703
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0703
     * @tc.desc   Testing query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_0703',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          let res: avMusicTemplate.Compilation[] | undefined = await controller!.queryCompilationByKeyword(keyword);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_0703 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0800
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          const searchType = avMusicTemplate.EntityType.fromValue(0);
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_0800 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0801
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0801',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          const searchType = avMusicTemplate.EntityType.fromValue(0);
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_0801 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0802
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          const searchType = avMusicTemplate.EntityType.fromValue(0);
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_0802 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0803
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0803
     * @tc.desc   Testing query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_0803',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const keyword = 'KEY_WORD';
          const searchType = avMusicTemplate.EntityType.fromValue(0);
          const pageIndex = 3;
          let res: avMusicTemplate.PageMediaEntity =
            await controller!.queryMediaEntityByKeyword(keyword, searchType, pageIndex);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_0803 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0900
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_0900 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0901
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_0901 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0902
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_0902 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0903
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0903
     * @tc.desc   Testing query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_0903',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryRecommendMediaEntityList();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_0903 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1000
     * @tc.desc   Testing query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_HOT_WORDS_THROWS_ERROR_1000 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1001
     * @tc.desc   Testing query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_HOT_WORDS_THROWS_ERROR_1001 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1002
     * @tc.desc   Testing query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_HOT_WORDS_THROWS_ERROR_1002 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1003
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1003
     * @tc.desc   Testing query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_1003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.queryHotWords();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_HOT_WORDS_THROWS_ERROR_1003 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1100
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.querySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_THROWS_ERROR_1100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1101
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.querySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_THROWS_ERROR_1101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1102
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.querySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_THROWS_ERROR_1102 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1103
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1103
     * @tc.desc   Testing query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_1103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.querySearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_SEARCH_HISTORY_THROWS_ERROR_1103 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1200
     * @tc.desc   Testing clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.clearSearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CLEAR_SEARCH_HISTORY_THROWS_ERROR_1200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1201
     * @tc.desc   Testing clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.clearSearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CLEAR_SEARCH_HISTORY_THROWS_ERROR_1201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1202
     * @tc.desc   Testing clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.clearSearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CLEAR_SEARCH_HISTORY_THROWS_ERROR_1202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1203
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1203
     * @tc.desc   Testing clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_1203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.clearSearchHistory();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CLEAR_SEARCH_HISTORY_THROWS_ERROR_1203 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1300
     * @tc.desc   Testing update settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "UPDATE_SETTINGS_THROWS_ERROR_1300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1301
     * @tc.desc   Testing update settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "UPDATE_SETTINGS_THROWS_ERROR_1301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1302
     * @tc.desc   Testing update settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "UPDATE_SETTINGS_THROWS_ERROR_1302 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1303
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1303
     * @tc.desc   Testing update settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_UPDATE_SETTINGS_THROWS_ERROR_STATIC_1303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const settingItem = FakerDataUtil.getSettingItem();
          let res: avMusicTemplate.SettingItem | undefined = await controller!.updateSettings(settingItem);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "UPDATE_SETTINGS_THROWS_ERROR_1303 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1400
     * @tc.desc   Testing report problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_1400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1401
     * @tc.desc   Testing report problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_1401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1402
     * @tc.desc   Testing report problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_1402 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1403
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1403
     * @tc.desc   Testing report problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_1403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const advice = 'to do something';
          let res: avMusicTemplate.OperResult | undefined = await controller!.reportProblemAndAdvice(advice);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REPORT_PROBLEM_AND_ADVICE_THROWS_ERROR_1403 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1500
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_THROWS_ERROR_1500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1501
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_THROWS_ERROR_1501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1502
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_THROWS_ERROR_1502 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1503
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1503
     * @tc.desc   Testing login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_LOGIN_THROWS_ERROR_STATIC_1503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const logType = 'queryLoginInfo' as avMusicTemplate.LoginType;
          const id = 'TestID1111';
          let res: avMusicTemplate.QrCodeInfo[] = await controller!.login(logType, id);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "LOGIN_THROWS_ERROR_1503 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1600
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_THROWS_ERROR_1600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1601
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_THROWS_ERROR_1601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1602
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1602',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_THROWS_ERROR_1602 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1603
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1603
     * @tc.desc   Testing request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_1603',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'open' as avMusicTemplate.DialogActionType;
          const actionInfo = FakerDataUtil.getDialogActionInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.requestDialogInfo(actionType, actionInfo);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "REQUEST_DIALOG_INFO_THROWS_ERROR_1603 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1700
     * @tc.desc   Testing handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "HANDLE_MEMBER_PURCHASE_THROWS_ERROR_1700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1701
     * @tc.desc   Testing handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "HANDLE_MEMBER_PURCHASE_THROWS_ERROR_1701 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1702
     * @tc.desc   Testing handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1702',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "HANDLE_MEMBER_PURCHASE_THROWS_ERROR_1702 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1703
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1703
     * @tc.desc   Testing handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1703',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const info: avMusicTemplate.MemberPurchaseInfo = await FakerDataUtil.getMemberPurchaseInfo();
          let res: avMusicTemplate.DialogInfo | undefined = await controller!.handleMemberPurchase(info);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "HANDLE_MEMBER_PURCHASE_THROWS_ERROR_1703 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1800
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const memberPurchaseType = avMusicTemplate.MemberPurchaseType.fromValue('normal');
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_THROWS_ERROR_1800 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1801
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1801',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const memberPurchaseType = avMusicTemplate.MemberPurchaseType.fromValue('normal');
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_THROWS_ERROR_1801 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1802
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const memberPurchaseType = avMusicTemplate.MemberPurchaseType.fromValue('normal');
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_THROWS_ERROR_1802 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1803
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1803
     * @tc.desc   Testing query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_1803',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const memberPurchaseType = avMusicTemplate.MemberPurchaseType.fromValue('normal');
          let res: avMusicTemplate.MemberPurchaseInfo[] | undefined =
            await controller!.queryMemberPurchase(memberPurchaseType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_MEMBER_PURCHASE_THROWS_ERROR_1803 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1900
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_THROWS_ERROR_1900 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1901
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_THROWS_ERROR_1901 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1902
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_THROWS_ERROR_1902 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1903
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1903
     * @tc.desc   Testing query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_1903',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let queryType: avMusicTemplate.CustomType[] = ['USER_INFO', 'TAB', 'COMPILATION', 'SETTINGS'];
          let res: avMusicTemplate.CustomElement | undefined = await controller!.queryCustomContent(queryType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "QUERY_CUSTOM_CONTENT_THROWS_ERROR_1903 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2000
     * @tc.desc   Testing download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_2000 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2001
     * @tc.desc   Testing download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_2001 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2002
     * @tc.desc   Testing download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_2002 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2003
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2003
     * @tc.desc   Testing download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_2003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.downloadMediaEntity('startDownload', mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_2003 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2100
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let command = avMusicTemplate.SearchPlayInfoType.fromValue('playMusic');
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_THROWS_ERROR_2100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2101
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let command = avMusicTemplate.SearchPlayInfoType.fromValue('playMusic');
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_THROWS_ERROR_2101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2102
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let command = avMusicTemplate.SearchPlayInfoType.fromValue('playMusic');
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_THROWS_ERROR_2102 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2103
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2103
     * @tc.desc   Testing play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_2103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let command = avMusicTemplate.SearchPlayInfoType.fromValue('playMusic');
          const args: avMusicTemplate.SearchPlayInfo = FakerDataUtil.getSearchPlayInfo();
          let res: avMusicTemplate.OperResult | undefined = await controller!.playForSearch(command, args);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_FOR_SEARCH_THROWS_ERROR_2103 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2200
     * @tc.desc   Testing execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "EXECUTE_ACTION_THROWS_ERROR_2200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2201
     * @tc.desc   Testing execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "EXECUTE_ACTION_THROWS_ERROR_2201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2202
     * @tc.desc   Testing execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "EXECUTE_ACTION_THROWS_ERROR_2202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2203
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2203
     * @tc.desc   Testing execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_EXECUTE_ACTION_THROWS_ERROR_STATIC_2203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const actionType = 'actionTypeTest';
          const params = 'paramsTest';
          let res: string | undefined = await controller!.executeAction(actionType, params);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "EXECUTE_ACTION_THROWS_ERROR_2203 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2300
     * @tc.desc   Testing play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_MEDIA_ENTITY_THROWS_ERROR_2300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2301
     * @tc.desc   Testing play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_MEDIA_ENTITY_THROWS_ERROR_2301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2302
     * @tc.desc   Testing play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_MEDIA_ENTITY_THROWS_ERROR_2302 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2303
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2303
     * @tc.desc   Testing play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_2303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          const mediaEntity = FakerDataUtil.getMediaEntity();
          await controller!.playMediaEntity(mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "PLAY_MEDIA_ENTITY_THROWS_ERROR_2303 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2400
     * @tc.desc   Testing favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_MEDIA_ENTITY_THROWS_ERROR_2400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2401
     * @tc.desc   Testing favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_MEDIA_ENTITY_THROWS_ERROR_2401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000003).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2402
     * @tc.desc   Testing favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_MEDIA_ENTITY_THROWS_ERROR_2402 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2403
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2403
     * @tc.desc   Testing favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_2403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let actionType = 'addFavorite' as avMusicTemplate.MediaFavoriteType;
          const mediaEntity = FakerDataUtil.getMediaEntity();
          let res: avMusicTemplate.OperResult | undefined =
            await controller!.favoriteMediaEntity(actionType, mediaEntity);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "FAVORITE_MEDIA_ENTITY_THROWS_ERROR_2403 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2500
     * @tc.desc   Testing on user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_USER_INFO_CHANGE_THROWS_ERROR_2500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2501
     * @tc.desc   Testing on user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_USER_INFO_CHANGE_THROWS_ERROR_2501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2502
     * @tc.desc   Testing on user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_USER_INFO_CHANGE_THROWS_ERROR_2502 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2600
     * @tc.desc   Testing off user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_USER_INFO_CHANGE_THROWS_ERROR_2600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2601
     * @tc.desc   Testing off user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_USER_INFO_CHANGE_THROWS_ERROR_2601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2602
     * @tc.desc   Testing off user info change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_USER_INFO_CHANGE_THROWS_ERROR_STATIC_2602',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offUserInfoChange((userInfo: avMusicTemplate.UserInfo) => {
            CommonUtils.logInfo(TAG, `2500: on userInfo=${JSON.stringify(userInfo)}`);
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_USER_INFO_CHANGE_THROWS_ERROR_2602 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2700
     * @tc.desc   Testing on dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2701
     * @tc.desc   Testing on dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2701 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2702
     * @tc.desc   Testing on dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2702',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2702 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2800
     * @tc.desc   Testing off dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2800 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2801
     * @tc.desc   Testing off dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2801',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2801 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2802
     * @tc.desc   Testing off dialog command change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_STATIC_2802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDialogCommandChange((type: avMusicTemplate.DialogControlType,
            buttonInfo: avMusicTemplate.DialogInfo) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DIALOG_COMMAND_CHANGE_THROWS_ERROR_2802 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2900
     * @tc.desc   Testing on current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_2900 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2901
     * @tc.desc   Testing on current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_2901 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2902
     * @tc.desc   Testing on current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_2902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CURRENT_SINGLE_CHANGE_THROWS_ERROR_2902 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3000
     * @tc.desc   Testing off current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_3000 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3001
     * @tc.desc   Testing off current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_3001 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3002
     * @tc.desc   Testing off current single change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_STATIC_3002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCurrentSingleChange((single: avMusicTemplate.Single) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CURRENT_SINGLE_CHANGE_THROWS_ERROR_3002 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3100
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3101
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3102
     * @tc.desc   Testing on media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3102 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3200
     * @tc.desc   Testing off media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3201
     * @tc.desc   Testing off media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3202
     * @tc.desc   Testing off media entities change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_STATIC_3202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offMediaEntitiesChange((mediaEntities: avMusicTemplate.MediaEntity[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_MEDIA_ENTITIES_CHANGE_THROWS_ERROR_3202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3300
     * @tc.desc   Testing on tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_TAB_CONTENT_CHANGE_THROWS_ERROR_3300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3301
     * @tc.desc   Testing on tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_TAB_CONTENT_CHANGE_THROWS_ERROR_3301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3302
     * @tc.desc   Testing on tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_TAB_CONTENT_CHANGE_THROWS_ERROR_3302 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3400
     * @tc.desc   Testing off tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_3400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3401
     * @tc.desc   Testing off tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_3401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3402
     * @tc.desc   Testing off tab content change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_STATIC_3402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offTabContentChange((tabId: string, tabContent: avMusicTemplate.MediaTabContent) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_TAB_CONTENT_CHANGE_THROWS_ERROR_3402 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3500
     * @tc.desc   Testing on playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAYLIST_CHANGE_THROWS_ERROR_3500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3501
     * @tc.desc   Testing on playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAYLIST_CHANGE_THROWS_ERROR_3501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3502
     * @tc.desc   Testing on playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_PLAYLIST_CHANGE_THROWS_ERROR_3502 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3600
     * @tc.desc   Testing off playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAYLIST_CHANGE_THROWS_ERROR_3600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3601
     * @tc.desc   Testing off playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAYLIST_CHANGE_THROWS_ERROR_3601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3602
     * @tc.desc   Testing off playlist change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAYLIST_CHANGE_THROWS_ERROR_STATIC_3602',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offPlaylistChange((playlist: avMusicTemplate.PageMediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_PLAYLIST_CHANGE_THROWS_ERROR_3602 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3700
     * @tc.desc   Testing on download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3701
     * @tc.desc   Testing on download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3701 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3702
     * @tc.desc   Testing on download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3702',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3702 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3800
     * @tc.desc   Testing off download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3800 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3801
     * @tc.desc   Testing off download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3801',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3801 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3802
     * @tc.desc   Testing off download media entity status change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_STATIC_3802',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offDownloadMediaEntityStatusChange((single: avMusicTemplate.MediaEntity) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_STATUS_CHANGE_THROWS_ERROR_3802 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3900
     * @tc.desc   Testing on custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_3900 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3901
     * @tc.desc   Testing on custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3901',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_3901 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3902
     * @tc.desc   Testing on custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_3902',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_3902 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4000
     * @tc.desc   Testing off custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_4000 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4001
     * @tc.desc   Testing off custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_4001 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4002
     * @tc.desc   Testing off custom elements change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_STATIC_4002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offCustomElementsChange((actionType: avMusicTemplate.ActionType,
            customType: avMusicTemplate.CustomType, customElement: avMusicTemplate.CustomElement) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_CUSTOM_ELEMENTS_CHANGE_THROWS_ERROR_4002 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4100
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_4100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4101
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_4101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4102
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_4102 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4200
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_4200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4201
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_4201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4202
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_4202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offSettingsChange((settingItems: avMusicTemplate.SettingItem[]) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_4202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4300
     * @tc.desc   Testing on report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_4300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4301
     * @tc.desc   Testing on report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_4301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4302
     * @tc.desc   Testing on report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_REPORT_EXECUTE_ACTION_THROWS_ERROR_4302 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400
     * @tc.desc   Testing off report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_4400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401
     * @tc.desc   Testing off report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_4401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402
     * @tc.desc   Testing off report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offReportExecuteAction((actionType: string, params: string) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_REPORT_EXECUTE_ACTION_THROWS_ERROR_4402 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4500
     * @tc.desc   Testing on extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4501
     * @tc.desc   Testing on extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4502
     * @tc.desc   Testing on extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.onExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4502 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4600
     * @tc.desc   Testing off extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4601
     * @tc.desc   Testing off extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 35000006).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4602
     * @tc.desc   Testing off extension ability change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_STATIC_4602',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          controller!.offExtensionAbilityChange((obj: object) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_EXTENSION_ABILITY_CHANGE_THROWS_ERROR_4602 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000012).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_4700
     * @tc.desc   Testing destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          controller!.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "DESTROY_THROWS_ERROR_4700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) !== 801).assertTrue();
          done();
        }
      })
  })
}