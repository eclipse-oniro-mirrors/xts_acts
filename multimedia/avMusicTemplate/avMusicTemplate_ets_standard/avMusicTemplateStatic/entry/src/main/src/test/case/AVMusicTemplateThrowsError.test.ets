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
import { CommonConstants } from '../constants/CommonConstants.test';
import { AVMusicTemplateUtil } from '../utils/AVMusicTemplateUtil.test';
import { CommonUtils } from '../utils/CommonUtil.test';
import { FakerDataUtil } from '../utils/FakerDataUtil.test';

const TAG = 'avMusicTemplateThrowsErrorTest';

export default function avMusicTemplateThrowsErrorTest() {
  describe('ActsAVMusicTemplateThrowsErrorTest', () => {
    let template: avMusicTemplate.AVMusicTemplate | null = null;
    let controller: avMusicTemplate.AVMusicTemplateController | null = null;

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
      template = AVMusicTemplateUtil.getTemplate();
      controller = AVMusicTemplateUtil.getController();
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
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_THROWS_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_THROWS_ERROR_STATIC_0100
     * @tc.desc   Testing start template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_START_TEMPLATE_THROWS_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await template!.startTemplate();
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "START_TEMPLATE_THROWS_ERROR_0100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0200
     * @tc.desc   Testing on query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MAIN_TABS_THROWS_ERROR_0200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0201
     * @tc.desc   Testing on query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MAIN_TABS_THROWS_ERROR_0201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0202
     * @tc.desc   Testing on query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MAIN_TABS_THROWS_ERROR_0202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0300
     * @tc.desc   Testing off query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MAIN_TABS_THROWS_ERROR_0300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0301
     * @tc.desc   Testing off query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MAIN_TABS_THROWS_ERROR_0301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0302
     * @tc.desc   Testing off query main tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MAIN_TABS_THROWS_ERROR_STATIC_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMainTabs(async (): Promise<avMusicTemplate.MediaTab[]> => {
          const sTabs = await FakerDataUtil.getMediaTabList()
          return sTabs;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MAIN_TABS_THROWS_ERROR_0302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0400
     * @tc.desc   Testing on query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0401
     * @tc.desc   Testing on query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0402
     * @tc.desc   Testing on query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0500
     * @tc.desc   Testing off query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0501
     * @tc.desc   Testing off query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0501 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0502
     * @tc.desc   Testing off query media tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_STATIC_0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaTabContent(async (tabId: string): Promise<avMusicTemplate.MediaTabContent> => {
            return FakerDataUtil.getMediaTabContent(tabId);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_TAB_CONTENT_THROWS_ERROR_0502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0600
     * @tc.desc   Testing on query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_0600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0601
     * @tc.desc   Testing on query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_0601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0602
     * @tc.desc   Testing on query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_THROWS_ERROR_0602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0700
     * @tc.desc   Testing off query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        template?.offQueryMediaEntity();
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_0700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0701
     * @tc.desc   Testing off query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_0701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0702
     * @tc.desc   Testing off query media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_STATIC_0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntity(async (params: avMusicTemplate.QueryMediaEntityParam): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(params.pageIndex);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_THROWS_ERROR_0702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0800
     * @tc.desc   Testing on query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_THROWS_ERROR_0800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0801
     * @tc.desc   Testing on query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_THROWS_ERROR_0801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0802
     * @tc.desc   Testing on query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_THROWS_ERROR_STATIC_0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_THROWS_ERROR_0802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0900
     * @tc.desc   Testing off query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_THROWS_ERROR_0900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0901
     * @tc.desc   Testing off query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_THROWS_ERROR_0901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0902
     * @tc.desc   Testing off query compilation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_THROWS_ERROR_STATIC_0902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilation(async (cid: string, pid: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_THROWS_ERROR_0902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1000
     * @tc.desc   Testing on query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
          template!.onQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_PLAYLIST_THROWS_ERROR_1000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1001
     * @tc.desc   Testing on query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
          template!.onQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_PLAYLIST_THROWS_ERROR_1001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1002
     * @tc.desc   Testing on query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
          template!.onQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_PLAYLIST_THROWS_ERROR_1002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1100
     * @tc.desc   Testing off query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_PLAYLIST_THROWS_ERROR_1100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1101
     * @tc.desc   Testing off query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_PLAYLIST_THROWS_ERROR_1101 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1102
     * @tc.desc   Testing off query playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_PLAYLIST_THROWS_ERROR_STATIC_1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryPlaylist(async (pid: int,
            sort: avMusicTemplate.Sort): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pid);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_PLAYLIST_THROWS_ERROR_1102 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1200
     * @tc.desc   Testing on query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_1200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1201
     * @tc.desc   Testing on query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_1201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1202
     * @tc.desc   Testing on query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CURRENT_SINGLE_THROWS_ERROR_1202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1300
     * @tc.desc   Testing off query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_1300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1301
     * @tc.desc   Testing off query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_1301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1302
     * @tc.desc   Testing off query current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_STATIC_1302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCurrentSingle(async (): Promise<avMusicTemplate.Single> => {
          return FakerDataUtil.getSingle();
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CURRENT_SINGLE_THROWS_ERROR_1302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1400
     * @tc.desc   Testing on query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1401
     * @tc.desc   Testing on query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1402
     * @tc.desc   Testing on query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1500
     * @tc.desc   Testing off query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1511
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1511
     * @tc.desc   Testing off query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1511 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1502
     * @tc.desc   Testing off query compilation by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_STATIC_1502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCompilationByKeyword(async (keyword: string): Promise<avMusicTemplate.Compilation[]> => {
          return [FakerDataUtil.getCompilation(keyword)];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_COMPILATION_BY_KEYWORD_THROWS_ERROR_1502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1600
     * @tc.desc   Testing on query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1601
     * @tc.desc   Testing on query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1602
     * @tc.desc   Testing on query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1700
     * @tc.desc   Testing off query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1701
     * @tc.desc   Testing off query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1702
     * @tc.desc   Testing off query media entity by keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_STATIC_1702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMediaEntityByKeyword(async (keyword: string, searchType: avMusicTemplate.EntityType,
            pageIndex: int): Promise<avMusicTemplate.PageMediaEntity> => {
            return FakerDataUtil.getPageMediaEntity(pageIndex, keyword, searchType);
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEDIA_ENTITY_BY_KEYWORD_THROWS_ERROR_1702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1800
     * @tc.desc   Testing on query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1801
     * @tc.desc   Testing on query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1802
     * @tc.desc   Testing on query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1900
     * @tc.desc   Testing off query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1901
     * @tc.desc   Testing off query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1902
     * @tc.desc   Testing off query recommend media entity list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_STATIC_1902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryRecommendMediaEntityList(async (): Promise<avMusicTemplate.MediaEntity[]> => {
            return [FakerDataUtil.getMediaEntity()];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_RECOMMEND_MEDIA_ENTITY_LIST_THROWS_ERROR_1902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2000
     * @tc.desc   Testing on query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = ['111', '2222', '3333'];
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_HOT_WORDS_THROWS_ERROR_2000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2001
     * @tc.desc   Testing on query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = ['111', '2222', '3333'];
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_HOT_WORDS_THROWS_ERROR_2001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2002
     * @tc.desc   Testing on query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = ['111', '2222', '3333'];
          template!.onQueryHotWords(async (): Promise<string[]> => {
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_HOT_WORDS_THROWS_ERROR_2002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2100
     * @tc.desc   Testing off query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryHotWords(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_HOT_WORDS_THROWS_ERROR_2100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2101
     * @tc.desc   Testing off query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryHotWords(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_HOT_WORDS_THROWS_ERROR_2101 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2102
     * @tc.desc   Testing off query hot words
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_HOT_WORDS_THROWS_ERROR_STATIC_2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryHotWords(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_HOT_WORDS_THROWS_ERROR_2102 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2200
     * @tc.desc   Testing on query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
                template!.onQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_2200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2201
     * @tc.desc   Testing on query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_2201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2202
     * @tc.desc   Testing on query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
                template!.onQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_SEARCH_HISTORY_THROWS_ERROR_2202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2300
     * @tc.desc   Testing off query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_2300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2301
     * @tc.desc   Testing off query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_2301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2302
     * @tc.desc   Testing off query search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_STATIC_2302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQuerySearchHistory(async (): Promise<string[]> => {
          const data = ['111', '2222', '3333'];
          return data;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_SEARCH_HISTORY_THROWS_ERROR_2302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2400
     * @tc.desc   Testing on clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2401
     * @tc.desc   Testing on clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2402
     * @tc.desc   Testing on clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2500
     * @tc.desc   Testing off clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2501
     * @tc.desc   Testing off clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2501 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2502
     * @tc.desc   Testing off clear search history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_STATIC_2502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offClearSearchHistory(async (): Promise<avMusicTemplate.OperResult> => {
            return FakerDataUtil.getOperResult();
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_CLEAR_SEARCH_HISTORY_THROWS_ERROR_2502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2600
     * @tc.desc   Testing on login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_LOGIN_THROWS_ERROR_2600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2601
     * @tc.desc   Testing on login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_LOGIN_THROWS_ERROR_2601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2602
     * @tc.desc   Testing on login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_LOGIN_THROWS_ERROR_STATIC_2602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_LOGIN_THROWS_ERROR_2602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2700
     * @tc.desc   Testing off login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_LOGIN_THROWS_ERROR_2700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2701
     * @tc.desc   Testing off login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_LOGIN_THROWS_ERROR_2701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2702
     * @tc.desc   Testing off login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_LOGIN_THROWS_ERROR_STATIC_2702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offLogin(async (controlType: string, id?: string): Promise<avMusicTemplate.QrCodeInfo[]> => {
            const qr = await FakerDataUtil.getQrCodeInfo(controlType, id);
            return [qr];
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_LOGIN_THROWS_ERROR_2702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2800
     * @tc.desc   Testing on request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_REQUEST_DIALOG_INFO_THROWS_ERROR_2800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2801
     * @tc.desc   Testing on request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_REQUEST_DIALOG_INFO_THROWS_ERROR_2801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2802
     * @tc.desc   Testing on request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_REQUEST_DIALOG_INFO_THROWS_ERROR_2802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2900
     * @tc.desc   Testing off request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_2900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2901
     * @tc.desc   Testing off request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_2901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2902
     * @tc.desc   Testing off request dialog info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_STATIC_2902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offRequestDialogInfo(async (actionType: avMusicTemplate.DialogActionType,
            actionInfo?: avMusicTemplate.DialogActionInfo): Promise<avMusicTemplate.DialogInfo> => {
            const res = await FakerDataUtil.getDialogInfo(actionType, actionInfo);
            return res;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_REQUEST_DIALOG_INFO_THROWS_ERROR_2902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3000
     * @tc.desc   Testing on handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3001
     * @tc.desc   Testing on handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3002
     * @tc.desc   Testing on handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3100
     * @tc.desc   Testing off handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3101
     * @tc.desc   Testing off handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3101 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3102
     * @tc.desc   Testing off handle member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offHandleMemberPurchase(async (info: avMusicTemplate.MemberPurchaseInfo): Promise<avMusicTemplate.DialogInfo> => {
          const dialogInfo = await FakerDataUtil.getDialogInfo();
          return dialogInfo;
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_HANDLE_MEMBER_PURCHASE_THROWS_ERROR_3102 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3200
     * @tc.desc   Testing on query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3201
     * @tc.desc   Testing on query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3202
     * @tc.desc   Testing on query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3300
     * @tc.desc   Testing off query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3301
     * @tc.desc   Testing off query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3302
     * @tc.desc   Testing off query member purchase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_STATIC_3302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryMemberPurchase(async (memberPurchaseType: avMusicTemplate.MemberPurchaseType): Promise<avMusicTemplate.MemberPurchaseInfo[]> => {
          let data = await FakerDataUtil.getMemberPurchaseInfo(memberPurchaseType);
          return [data];
        });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_MEMBER_PURCHASE_THROWS_ERROR_3302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3400
     * @tc.desc   Testing on query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3401
     * @tc.desc   Testing on query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3402
     * @tc.desc   Testing on query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3500
     * @tc.desc   Testing off query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3501
     * @tc.desc   Testing off query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3501 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3502
     * @tc.desc   Testing off query custom content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_STATIC_3502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offQueryCustomContent(async (queryType: avMusicTemplate.CustomType[]): Promise<avMusicTemplate.CustomElement> => {
            const data = FakerDataUtil.getCustomElement(queryType);
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_QUERY_CUSTOM_CONTENT_THROWS_ERROR_3502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3600
     * @tc.desc   Testing on download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3601
     * @tc.desc   Testing on download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3602
     * @tc.desc   Testing on download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3700
     * @tc.desc   Testing off download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offDownloadMediaEntity(async (controlType: avMusicTemplate.DownloadControlType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            const cTypes = ['startDownload', 'deleteDownload', 'resumeDownload', 'pauseDownload'];
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (cTypes.indexOf(controlType) === -1) {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3701
     * @tc.desc   Testing off download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offDownloadMediaEntity(async (controlType: avMusicTemplate.DownloadControlType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            const cTypes = ['startDownload', 'deleteDownload', 'resumeDownload', 'pauseDownload'];
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (cTypes.indexOf(controlType) === -1) {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3702
     * @tc.desc   Testing off download media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_STATIC_3702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offDownloadMediaEntity(async (controlType: avMusicTemplate.DownloadControlType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            const cTypes = ['startDownload', 'deleteDownload', 'resumeDownload', 'pauseDownload'];
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' };
            if (cTypes.indexOf(controlType) === -1) {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_DOWNLOAD_MEDIA_ENTITY_THROWS_ERROR_3702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3800
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_3800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3801
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_3801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3802
     * @tc.desc   Testing on settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_SETTINGS_CHANGE_THROWS_ERROR_3802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3900
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_3900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3901
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_3901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3902
     * @tc.desc   Testing off settings change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_SETTINGS_CHANGE_THROWS_ERROR_STATIC_3902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offSettingsChange(async (settingItem: avMusicTemplate.SettingItem): Promise<avMusicTemplate.SettingItem> => {
            return settingItem;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_SETTINGS_CHANGE_THROWS_ERROR_3902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4000
     * @tc.desc   Testing on problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PROBLEM_AND_ADVICE_THROWS_ERROR_4000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4001
     * @tc.desc   Testing on problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PROBLEM_AND_ADVICE_THROWS_ERROR_4001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4002
     * @tc.desc   Testing on problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PROBLEM_AND_ADVICE_THROWS_ERROR_4002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4100
     * @tc.desc   Testing off problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_4100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4101
     * @tc.desc   Testing off problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_4101 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4102
     * @tc.desc   Testing off problem and advice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_STATIC_4102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offProblemAndAdvice(async (advice: string): Promise<avMusicTemplate.OperResult> => {
            const data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: advice };
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PROBLEM_AND_ADVICE_THROWS_ERROR_4102 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4200
     * @tc.desc   Testing on play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
            let commandStr: string = command;
            if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_FOR_SEARCH_THROWS_ERROR_4200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4201
     * @tc.desc   Testing on play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
          let commandStr: string = command;
          if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_FOR_SEARCH_THROWS_ERROR_4201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4202
     * @tc.desc   Testing on play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
          let commandStr: string = command;
          if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_FOR_SEARCH_THROWS_ERROR_4202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4300
     * @tc.desc   Testing off play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
          let commandStr: string = command;
          if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_FOR_SEARCH_THROWS_ERROR_4300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4301
     * @tc.desc   Testing off play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
          let commandStr: string = command;
          if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_FOR_SEARCH_THROWS_ERROR_4301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4302
     * @tc.desc   Testing off play for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_FOR_SEARCH_THROWS_ERROR_STATIC_4302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayForSearch(async (command: avMusicTemplate.SearchPlayInfoType,
            args: avMusicTemplate.SearchPlayInfo): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: '' };
          let commandStr: string = command;
          if (commandStr !== 'playMusic' && commandStr !== 'playVideo') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_FOR_SEARCH_THROWS_ERROR_4302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400
     * @tc.desc   Testing on execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_EXECUTE_ACTION_THROWS_ERROR_4400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401
     * @tc.desc   Testing on execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_EXECUTE_ACTION_THROWS_ERROR_4401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402
     * @tc.desc   Testing on execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_EXECUTE_ACTION_THROWS_ERROR_STATIC_4402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_EXECUTE_ACTION_THROWS_ERROR_4402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4500
     * @tc.desc   Testing off execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_EXECUTE_ACTION_THROWS_ERROR_4500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4501
     * @tc.desc   Testing off execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_EXECUTE_ACTION_THROWS_ERROR_4501 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4502
     * @tc.desc   Testing off execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_EXECUTE_ACTION_THROWS_ERROR_STATIC_4502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offExecuteAction(async (actionType: string, params: string): Promise<string> => {
            let data = actionType + params;
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_EXECUTE_ACTION_THROWS_ERROR_4502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4600
     * @tc.desc   Testing on play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_4600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4601
     * @tc.desc   Testing on play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_4601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4602
     * @tc.desc   Testing on play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_PLAY_MEDIA_ENTITY_THROWS_ERROR_4602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4700
     * @tc.desc   Testing off play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_4700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4701
     * @tc.desc   Testing off play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_4701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4702
     * @tc.desc   Testing off play media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_STATIC_4702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offPlayMediaEntity(async (mediaEntity: avMusicTemplate.MediaEntity): Promise<void> => {});
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_PLAY_MEDIA_ENTITY_THROWS_ERROR_4702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4800
     * @tc.desc   Testing on favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4801
     * @tc.desc   Testing on favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4802
     * @tc.desc   Testing on favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template!.onFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "ON_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4900
     * @tc.desc   Testing off favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4901
     * @tc.desc   Testing off favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4902
     * @tc.desc   Testing off favorite media entity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_STATIC_4902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.offFavoriteMediaEntity(async (actionType: avMusicTemplate.MediaFavoriteType,
            mediaEntity: avMusicTemplate.MediaEntity): Promise<avMusicTemplate.OperResult> => {
            let data: avMusicTemplate.OperResult = { errorCode: CommonConstants.SUCCESS_CODE, errorMsg: 'success' }
            if (actionType !== 'addFavorite' && actionType !== 'removeFavorite') {
              data.errorCode = -1;
            }
            return data;
          });
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "OFF_FAVORITE_MEDIA_ENTITY_THROWS_ERROR_4902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000012).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5000
     * @tc.desc   Testing set user info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
        await template!.setUserInfo(userInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_USER_INFO_THROWS_ERROR_5000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5001
     * @tc.desc   Testing set user info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
        await template!.setUserInfo(userInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_USER_INFO_THROWS_ERROR_5001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5002
     * @tc.desc   Testing set user info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_USER_INFO_THROWS_ERROR_STATIC_5002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const userInfo: avMusicTemplate.UserInfo = FakerDataUtil.getUserInfo();
        await template!.setUserInfo(userInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_USER_INFO_THROWS_ERROR_5002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5100
     * @tc.desc   Testing set dialog command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DIALOG_COMMAND_THROWS_ERROR_5100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5101
     * @tc.desc   Testing set dialog command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DIALOG_COMMAND_THROWS_ERROR_5101 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5102
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5102
     * @tc.desc   Testing set dialog command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DIALOG_COMMAND_THROWS_ERROR_STATIC_5102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const dcType = 'open' as avMusicTemplate.DialogControlType;
          const dialogInfo: avMusicTemplate.DialogInfo = await FakerDataUtil.getDialogInfo();
          await template!.setDialogCommand(dcType, dialogInfo);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DIALOG_COMMAND_THROWS_ERROR_5102 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5200
     * @tc.desc   Testing set current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CURRENT_SINGLE_THROWS_ERROR_5200 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5201
     * @tc.desc   Testing set current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CURRENT_SINGLE_THROWS_ERROR_5201 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5202
     * @tc.desc   Testing set current single
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CURRENT_SINGLE_THROWS_ERROR_STATIC_5202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSingle();
          await template!.setCurrentSingle(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CURRENT_SINGLE_THROWS_ERROR_5202 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5300
     * @tc.desc   Testing set media entities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getMediaEntity();
          await template!.setMediaEntities([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_MEDIA_ENTITIES_THROWS_ERROR_5300 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5301
     * @tc.desc   Testing set media entities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getMediaEntity();
          await template!.setMediaEntities([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_MEDIA_ENTITIES_THROWS_ERROR_5301 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5302
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5302
     * @tc.desc   Testing set media entities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_MEDIA_ENTITIES_THROWS_ERROR_STATIC_5302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getMediaEntity();
          await template!.setMediaEntities([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_MEDIA_ENTITIES_THROWS_ERROR_5302 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5400
     * @tc.desc   Testing set tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const tabId = 'Tabid12335423';
          const tabContent = FakerDataUtil.getMediaTabContent(tabId);
          await template!.setTabContent(tabId, tabContent);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_TAB_CONTENT_THROWS_ERROR_5400 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5401
     * @tc.desc   Testing set tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const tabId = 'Tabid12335423';
          const tabContent = FakerDataUtil.getMediaTabContent(tabId);
          await template!.setTabContent(tabId, tabContent);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_TAB_CONTENT_THROWS_ERROR_5401 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5402
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5402
     * @tc.desc   Testing set tab content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_TAB_CONTENT_THROWS_ERROR_STATIC_5402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const tabId = 'Tabid12335423';
          const tabContent = FakerDataUtil.getMediaTabContent(tabId);
          await template!.setTabContent(tabId, tabContent);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_TAB_CONTENT_THROWS_ERROR_5402 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5500
     * @tc.desc   Testing set playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(2);
          await template!.setPlaylist(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_PLAYLIST_THROWS_ERROR_5500 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5501
     * @tc.desc   Testing set playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(2);
          await template!.setPlaylist(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_PLAYLIST_THROWS_ERROR_5501 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5502
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5502
     * @tc.desc   Testing set playlist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_PLAYLIST_THROWS_ERROR_STATIC_5502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data: avMusicTemplate.PageMediaEntity = FakerDataUtil.getPageMediaEntity(2);
          await template!.setPlaylist(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_PLAYLIST_THROWS_ERROR_5502 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5600
     * @tc.desc   Testing set download media entity status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_5600 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5601
     * @tc.desc   Testing set download media entity status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_5601 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5602
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5602
     * @tc.desc   Testing set download media entity status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_STATIC_5602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const single = FakerDataUtil.getSingle();
          await template!.setDownloadMediaEntityStatus(single);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_DOWNLOAD_MEDIA_ENTITY_STATUS_THROWS_ERROR_5602 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5700
     * @tc.desc   Testing set custom elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'add' as avMusicTemplate.ActionType;
          const customType = 'USER_INFO' as avMusicTemplate.CustomType;
          const customElement = await FakerDataUtil.getCustomElement([customType])
          await template!.setCustomElements(actionType, customType, customElement);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CUSTOM_ELEMENTS_THROWS_ERROR_5700 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5701
     * @tc.desc   Testing set custom elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'add' as avMusicTemplate.ActionType;
          const customType = 'USER_INFO' as avMusicTemplate.CustomType;
          const customElement = await FakerDataUtil.getCustomElement([customType])
          await template!.setCustomElements(actionType, customType, customElement);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CUSTOM_ELEMENTS_THROWS_ERROR_5701 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5702
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5702
     * @tc.desc   Testing set custom elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_CUSTOM_ELEMENTS_THROWS_ERROR_STATIC_5702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'add' as avMusicTemplate.ActionType;
          const customType = 'USER_INFO' as avMusicTemplate.CustomType;
          const customElement = await FakerDataUtil.getCustomElement([customType])
          await template!.setCustomElements(actionType, customType, customElement);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_CUSTOM_ELEMENTS_THROWS_ERROR_5702 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5800
     * @tc.desc   Testing set settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_SETTINGS_THROWS_ERROR_5800 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5801
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5801
     * @tc.desc   Testing set settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_SETTINGS_THROWS_ERROR_5801 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5802
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5802
     * @tc.desc   Testing set settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_SETTINGS_THROWS_ERROR_STATIC_5802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = FakerDataUtil.getSettingItem();
          await template!.setSettings([data]);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_SETTINGS_THROWS_ERROR_5802 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5900
     * @tc.desc   Testing report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "REPORT_EXECUTE_ACTION_THROWS_ERROR_5900 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5901
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5901
     * @tc.desc   Testing report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "REPORT_EXECUTE_ACTION_THROWS_ERROR_5901 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5902
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5902
     * @tc.desc   Testing report execute action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_REPORT_EXECUTE_ACTION_THROWS_ERROR_STATIC_5902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const actionType = 'actionTypeTest'
          const params = 'paramsTest';
          await template!.reportExecuteAction(actionType, params);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "REPORT_EXECUTE_ACTION_THROWS_ERROR_5902 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6000
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6000
     * @tc.desc   Testing set extension ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await FakerDataUtil.getWantAgent();
        template!.setExtensionAbility(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_EXTENSION_ABILITY_THROWS_ERROR_6000 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6001
     * @tc.desc   Testing set extension ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await FakerDataUtil.getWantAgent();
          template!.setExtensionAbility(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_EXTENSION_ABILITY_THROWS_ERROR_6001 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000005).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6002
     * @tc.desc   Testing set extension ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_SET_EXTENSION_ABILITY_THROWS_ERROR_STATIC_6002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await FakerDataUtil.getWantAgent();
        template!.setExtensionAbility(data);
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "SET_EXTENSION_ABILITY_THROWS_ERROR_6002 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 35000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_6100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_6100
     * @tc.desc   Testing destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_DESTROY_THROWS_ERROR_STATIC_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        template?.destroy();
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "DESTROY_THROWS_ERROR_6100 catch err: " + CommonUtils.getError(err));
        expect(Number(err.code) === 801).assertTrue();
        done();
      }
    })



  })
}