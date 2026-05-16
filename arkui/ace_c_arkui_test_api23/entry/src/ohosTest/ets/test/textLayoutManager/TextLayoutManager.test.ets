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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import render from 'libnativerender.so';

export default function TextLayoutManagerTest() {

  describe('TextLayoutManagerTest', () => {

    let PAGE_TAG = 'TextLayoutManagerTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textLayoutManager/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   TextLayoutManagerTest001
     * @tc.number TextLayoutManagerTest001
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest001 START-----');
      expect(render.TextLayoutManagerTest001(PAGE_TAG)).assertEqual(0)
      done();
    });

    /**
     * @tc.name   TextLayoutManagerTest002
     * @tc.number TextLayoutManagerTest002
     * @tc.desc   test CompressLeadingPunctuationTest is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[TextLayoutManagerTest002] START----');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let targetButton = await driver.findComponent(ON.id('LayoutManagerTestButton01'));
      await targetButton.click();
      await Utils.sleep(1000);
      console.info('buttonCompressLeadingPunctuation1 click')
      await Utils.sleep(1000);
      expect(render.check_TextLayoutManagerTest002(PAGE_TAG)).assertEqual(0)
      done();
    })

/**
     * @tc.name   TextLayoutManagerTest003
     * @tc.number TextLayoutManagerTest003
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest003 START-----');
      expect(render.TextLayoutManagerTest003(PAGE_TAG)).assertEqual(0)
      done();
    });
    /**
     * @tc.name   TextLayoutManagerTest004
     * @tc.number TextLayoutManagerTest004
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest004 START-----');
      expect(render.TextLayoutManagerTest004(PAGE_TAG)).assertEqual(0)
      done();
    });
    /**
     * @tc.name   TextLayoutManagerTest005
     * @tc.number TextLayoutManagerTest005
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest005 START-----');
      expect(render.TextLayoutManagerTest005(PAGE_TAG)).assertEqual(0)
      done();
    });

    
    /**
     * @tc.name   TextLayoutManagerTest006
     * @tc.number TextLayoutManagerTest006
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest006 START-----');
      expect(render.check_g_GetRectsForRange_ret(PAGE_TAG)).assertEqual(0)
      done();
    });

    
    /**
     * @tc.name   TextLayoutManagerTest007
     * @tc.number TextLayoutManagerTest007
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest007 START-----');
      expect(render.check_g_GetGlyphPositionAtCoordinate_ret(PAGE_TAG)).assertEqual(0)
      done();
    });

    
    /**
     * @tc.name   TextLayoutManagerTest008
     * @tc.number TextLayoutManagerTest008
     * @tc.desc   test CompressLeadingPunctuationTest is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextLayoutManagerTest008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextLayoutManagerTest008 START-----');
      expect(render.check_g_GetLineMetrics_ret(PAGE_TAG)).assertEqual(0)
      done();
    });



  })
}