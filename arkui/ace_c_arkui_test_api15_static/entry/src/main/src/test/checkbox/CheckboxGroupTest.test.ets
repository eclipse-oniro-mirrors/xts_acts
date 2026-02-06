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

import { expect, beforeEach, beforeAll, describe, it, Level} from '../../../../hypium';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test'

export default function checkboxGroupTest() {

  describe('CheckboxGroupTest', () => {

    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("CheckboxGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkbox/CheckboxGroupTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckboxGroupTest state pages: " + JSON.stringify(pages));
        if (!("checkbox/CheckboxGroupTest" == pages.name)) {
          console.info("get CheckboxGroupTest  state pages.name: " + JSON.stringify(pages.name));
          await Utils.sleep(3000)
        }
      } catch (err) {
        console.error("push CheckboxGroupTest page error:" + err);
      }
      console.info("CheckboxGroupTest beforeEach end");
    })

    
    /**
     * @tc.number   checkboxGroupTest001
     * @tc.name     checkboxGroupTest001
     * @tc.desc     checkboxGroupTest001
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log('checkboxGroupTest001 start')
      let strJson = inspector.getInspectorByKey('checkbox1'); //可能是inspector.getInspectorByKey返回值有问题 strJson无法打印 导致crash
      console.log('checkboxGroupTest001  inspector.getInspectorByKey start')
      await Utils.sleep(1000);
      // console.info('checkboxGroupTest001 strJson ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(3000)
      expect(obj.getElement('$attrs').getString('group')).assertEqual('checkboxgroupTrue');
      done();
    })
  })
}
