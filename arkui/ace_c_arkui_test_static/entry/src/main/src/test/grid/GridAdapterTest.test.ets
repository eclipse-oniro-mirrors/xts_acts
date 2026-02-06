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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import { describe, expect, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton,Component,Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function gridAdapterTest() {

  describe('GridAdapterTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
    })

    

    
/**
     * @tc.number   testGridAdapter001
     * @tc.name     testGridAdapter001
     * @tc.desc     testGridAdapter001
     * @tc.level    Level.LEVEL1
     */
    it('testGridAdapter001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GridAdapterTest';
      await Utils.pushPage(`grid/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = Driver.create();
      let component:Component = await driver.findComponent(ON.id("grid")) as Component;
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      done();
    });
  })
}

