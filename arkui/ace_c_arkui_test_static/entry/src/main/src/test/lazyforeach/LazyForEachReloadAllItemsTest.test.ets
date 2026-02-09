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
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';

let libUtil: LibUtil = new LibUtil();

const SleepTime: Int = 1000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachReloadAllItemsTest() {

  describe('LazyForEachReloadAllItemsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testLazyForEachReloadAllItems001
     * @tc.name     testLazyForEachReloadAllItems001
     * @tc.desc     testLazyForEachReloadAllItems001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachReloadAllItems001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log('testLazyForEachReloadAllItems001 Utils.pushPage start')
      await Utils.pushPage(`lazyforeach/LazyForEachReloadAllItemsTest`)
      console.log('testLazyForEachReloadAllItems001 Utils.pushPage start')
      await Utils.clickComponent('btn')
      await Utils.sleep(SleepTime)
      let strJson = inspector.getInspectorByKey('col');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(ColorGreen)
      done()
    })


    
    /**
     * @tc.number   testLazyForEachReloadAllItems002
     * @tc.name     testLazyForEachReloadAllItems002
     * @tc.desc     testLazyForEachReloadAllItems002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachReloadAllItems002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachReloadAllItems002()).assertEqual(0)
      done()
    })

  })
}