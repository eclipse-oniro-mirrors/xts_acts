'use static';
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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType }
  from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function FrameNodeCreateTextAreaNode() {
  describe('FrameNodeCreateTextAreaNode', () => {
    beforeAll(async (): Promise<void> => {
      console.info("FrameNodeCreateTextAreaNode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.XNode.api20.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info("FrameNodeCreateTextAreaNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/FrameNodeCreateTextAreaNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FrameNodeCreateTextAreaNode state pages:" + JSON.stringify(pages));
        if (!("FrameNodeCreateTextAreaNode" == pages.name)) {
          console.info("get FrameNodeCreateTextAreaNode pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FrameNodeCreateTextAreaNode page error:" + err);
      }
      console.info("FrameNodeCreateTextAreaNode beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FrameNodeCreateTextAreaNode after each called");
    });
        
    /**
     * @tc.name     FrameNodeCreateTextAreaNode_static_0100
     * @tc.number   SUB_ARKUI_API_FrameNodeCreateTextAreaNode_static_0100
     * @tc.desc     FrameNodeCreateTextAreaNode_static_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUM
     * @tc.level    Level.LEVEL0
     */
it('FrameNodeCreateTextAreaNode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FrameNodeCreateTextAreaNode_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.waitForComponent(ON.id('error_textArea_id'), 3000) as Component;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('error_textArea_key');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateTextAreaNode_static_0100] content1:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('createTextAreaNode success');
      
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('error_textArea_key');
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateTextAreaNode_static_0100] content2:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('change textArea backgroundColor error');
      console.info('[FrameNodeCreateTextAreaNode_static_0100] END');
      done();
    });
  })
}