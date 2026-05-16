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

import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';
let libUtil:LibUtil = new LibUtil();

export default function customComponentMeasureNodeTest() {

  describe('CustomComponentMeasureNodeTest', () => {

    let PAGE_TAG = 'CustomComponentMeasureNodeTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testCustomComponentMeasureNode001
     * @tc.name     testCustomComponentMeasureNode001
     * @tc.desc     testCustomComponentMeasureNode001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentMeasureNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let dataArray: number[][] = libUtil.getMeasureNodeData();
      let measureNodeData: number[] = dataArray[0];
      console.log('testCustomComponentMeasureNode001', JSON.stringify(dataArray))
      expect(measureNodeData[0] == 40 && measureNodeData[1] == 140).assertEqual(true)
      expect(measureNodeData[2] == 110 && measureNodeData[3] == 30).assertEqual(true)
      expect(measureNodeData[4] == 110 && measureNodeData[5] == 140).assertEqual(true)
      done()
    })
  })
}
