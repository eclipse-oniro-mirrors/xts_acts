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

export default function lazyForEachGetRemovedNodeTest() {

  describe('LazyForEachGetRemovedNodeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testLazyForEachGetRemovedNode001
     * @tc.name     testLazyForEachGetRemovedNode001
     * @tc.desc     testLazyForEachGetRemovedNode001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachGetRemovedNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`lazyforeach/LazyForEachGetRemovedNodeTest`)
      await Utils.clickComponent('btn')
      await Utils.sleep(SleepTime)
      let strJson = inspector.getInspectorByKey('gridGetRemovedNode');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(ColorGreen)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachGetRemovedNode002
     * @tc.name     testLazyForEachGetRemovedNode002
     * @tc.desc     testLazyForEachGetRemovedNode002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachGetRemovedNode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachGetRemovedNode002()).assertEqual(0)
      done()
    })

  })
}