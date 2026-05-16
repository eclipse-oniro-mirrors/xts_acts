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
import { ScrollState, ScrollSource,focusControl } from '@ohos.arkui.component'
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

export default function spanOnClickTest() {

  describe('SpanOnClickTest', () => {

    let PAGE_TAG = 'SpanOnClickTest';

    
    
/**
     * @tc.number   testSpanOnClick001
     * @tc.name     testSpanOnClick001
     * @tc.desc     testSpanOnClick001
     * @tc.level    Level.LEVEL1
     */
    it('testSpanOnClick001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.pushPage(`span/${PAGE_TAG}`);
      focusControl.requestFocus('SpanClickText')
      await Utils.sleep(2000);
      await Utils.clickComponent('SpanClickText');
      await Utils.sleep(4000);
      let strJson1 = inspector.getInspectorByKey('SpanClickText');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')

      done();
    })

  })
}