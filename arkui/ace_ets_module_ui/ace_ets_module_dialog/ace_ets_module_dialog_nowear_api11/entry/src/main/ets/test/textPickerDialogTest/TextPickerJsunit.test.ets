/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function textPickerJsunit() {
  describe('appInfoTest_four_13', () => {
    beforeEach(async (done: Function) => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialog2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPickerDialog state pages: " + JSON.stringify(pages));
        if (!("textPickerDialog2" == pages.name)) {
          console.info("get textPickerDialog state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textPickerDialog page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textPickerDialog after each called");
    })

    it('testTextPickerDialog0100', Level.LEVEL2, async (done: Function) => {
      console.info('[testTextPickerDialog0100] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textPickerDialog');
      console.info("[testTextPickerDialog0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[testTextPickerDialog0100] expect(obj.$type) is: " + (JSON.parse(strJson).$type));
      console.info("[testTextPickerDialog0100] obj.$attrs.type is: " + (JSON.parse(strJson).$attrs.type));
      done();
    });

    it('testTextPickerDialog0200', Level.LEVEL2, async (done: Function) => {
      console.info('[testTextPickerDialog0200] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('textPickerDialog');
      if (true) {
        done();
        return;
      }
      /*
      const textPickerDialogOption = new textPickerDialogOption();
      textPickerDialogOption.defaultPickerItemHeight = 20;
      const textPickerAttribute = new TextPickerAttribute();
      textPickerAttribute.defaultPickerItemHeight = 20;
      const textPickerOption = new TextPickerOption();
      textPickerOption.value = "textPickerOptionTest";
      */
      done();
    });
  })
}
