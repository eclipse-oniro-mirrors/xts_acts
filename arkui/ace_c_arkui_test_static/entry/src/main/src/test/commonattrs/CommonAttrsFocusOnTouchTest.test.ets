'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsFocusOnTouchTest() {

  describe('CommonAttrsFocusOnTouchTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsFocusOnTouch001
     * @tc.name     testCommonAttrsFocusOnTouch001
     * @tc.desc     testCommonAttrsFocusOnTouch001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusOnTouch001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`commonattrs/CommonAttrsFocusOnTouchTest`, false);
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('btnFocusOnTouch');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#0xFF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsFocusOnTouch002
     * @tc.name     testCommonAttrsFocusOnTouch002
     * @tc.desc     testCommonAttrsFocusOnTouch002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusOnTouch002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsFocusOnTouch002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsFocusOnTouch003
     * @tc.name     testCommonAttrsFocusOnTouch003
     * @tc.desc     testCommonAttrsFocusOnTouch003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusOnTouch003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsFocusOnTouch003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsFocusOnTouch004
     * @tc.name     testCommonAttrsFocusOnTouch004
     * @tc.desc     testCommonAttrsFocusOnTouch004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusOnTouch004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsFocusOnTouch004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsFocusOnTouch005
     * @tc.name     testCommonAttrsFocusOnTouch005
     * @tc.desc     testCommonAttrsFocusOnTouch005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsFocusOnTouch005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsFocusOnTouch005()).assertEqual(0)
      done()
    })
  })
}
