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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

const SleepTime: Int = 2000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachGetAllItemsTest() {

  describe('LazyForEachGetAllItemsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testLazyForEachGetAllItems001
     * @tc.name     testLazyForEachGetAllItems001
     * @tc.desc     testLazyForEachGetAllItems001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachGetAllItems001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`lazyforeach/LazyForEachGetAllItemsTest`)
      await Utils.clickComponent('btn')
      await Utils.sleep(SleepTime)
      let strJson = inspector.getInspectorByKey('colGetAllItems');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(ColorGreen)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachGetAllItems002
     * @tc.name     testLazyForEachGetAllItems002
     * @tc.desc     testLazyForEachGetAllItems002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachGetAllItems002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachGetAllItems002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachGetAllItems003
     * @tc.name     testLazyForEachGetAllItems003
     * @tc.desc     testLazyForEachGetAllItems003
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachGetAllItems003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachGetAllItems003()).assertEqual(0)
      done()
    })
  })
}