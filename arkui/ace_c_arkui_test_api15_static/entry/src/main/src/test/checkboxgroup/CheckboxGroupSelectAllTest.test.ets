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

export default function checkboxGroupSelectAllTest() {

  describe('CheckboxGroupSelectAllTest', () => {

    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("CheckboxGroupSelectAllTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkboxgroup/CheckboxGroupSelectAllTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckboxGroupSelectAllTest state pages: " + JSON.stringify(pages));
        if (!("CheckboxGroupSelectAllTest" == pages.name)) {
          console.info("get CheckboxGroupSelectAllTest  state pages.name: " + JSON.stringify(pages.name));
          await Utils.sleep(3000)
        }
      } catch (err) {
        console.error("push CheckboxGroupSelectAllTest page error:" + err);
      }
      console.info("CheckboxGroupSelectAllTest beforeEach end");
    })

    
    /**
     * @tc.number   checkboxGroupSelectAllTest001
     * @tc.name     checkboxGroupSelectAllTest001
     * @tc.desc     checkboxGroupSelectAllTest001
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupSelectAllTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let  strJson = inspector.getInspectorByKey('checkboxgroupTrue') //可能是inspector.getInspectorByKey返回值有问题 strJson无法打印 导致crash
      await Utils.sleep(1000)
      // console.info('checkboxGroupSelectAllTest001 strJson ' + strJson)
      let obj = JSON.parseJsonElement(strJson)
      await Utils.sleep(3000)
      console.info('CheckboxGroupSelectAllTest selectAll ' + JSON.stringify(obj.getElement('$attrs').getString('selectAll')))
      expect(obj.getElement('$attrs').getString('selectAll')).assertEqual("true")
      console.info('CheckboxGroupSelectAllTest selectAll end')
      done();
    })

    
    /**
     * @tc.number   checkboxGroupSelectAllTest002
     * @tc.name     checkboxGroupSelectAllTest002
     * @tc.desc     checkboxGroupSelectAllTest002
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupSelectAllTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('checkboxgroupFalse')//可能是inspector.getInspectorByKey返回值有问题 strJson无法打印 导致crash
      await Utils.sleep(1000)
      // console.info('checkboxGroupSelectAllTest002 strJson ' + strJson)
      let obj = JSON.parseJsonElement(strJson)
      await Utils.sleep(3000)
      console.info('CheckboxGroupSelectAllTest selectAll ' + JSON.stringify(obj.getElement('$attrs').getString('selectAll')))
      expect(obj.getElement('$attrs').getString('selectAll')).assertEqual("false")
      console.info('CheckboxGroupSelectAllTest selectAll end')
      done();
    })
  })
}
