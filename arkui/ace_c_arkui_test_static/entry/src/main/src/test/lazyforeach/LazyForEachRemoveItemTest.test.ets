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

export default function lazyForEachRemoveItemTest() {

  describe('LazyForEachRemoveItemTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testLazyForEachRemoveItem001
     * @tc.name     testLazyForEachRemoveItem001
     * @tc.desc     testLazyForEachRemoveItem001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRemoveItem001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`lazyforeach/LazyForEachRemoveItemTest`)
      await Utils.clickComponent('btn')
      await Utils.sleep(SleepTime)
      let strJson = inspector.getInspectorByKey('ColRemoveItem');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(ColorGreen)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachRemoveItem002
     * @tc.name     testLazyForEachRemoveItem002
     * @tc.desc     testLazyForEachRemoveItem002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRemoveItem002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachRemoveItem002()).assertEqual(0)
      done()
    })

  })
}