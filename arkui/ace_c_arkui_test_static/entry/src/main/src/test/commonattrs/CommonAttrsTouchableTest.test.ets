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
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsTouchableTest() {

  describe('CommonAttrsTouchableTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTouchable001
     * @tc.name     testCommonAttrsTouchable001
     * @tc.desc     testCommonAttrsTouchable001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTouchable001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`commonattrs/CommonAttrsTouchableTest`, false);
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('btnTouchable');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#0xFF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTouchable002
     * @tc.name     testCommonAttrsTouchable002
     * @tc.desc     testCommonAttrsTouchable002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTouchable002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTouchable002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTouchable003
     * @tc.name     testCommonAttrsTouchable003
     * @tc.desc     testCommonAttrsTouchable003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTouchable003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTouchable003()).assertEqual(0)
      done()
    })
    
    
    
/**
     * @tc.number   testCommonAttrsTouchable004
     * @tc.name     testCommonAttrsTouchable004
     * @tc.desc     testCommonAttrsTouchable004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTouchable004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTouchable004()).assertEqual(0)
      done()
    })
  })
}