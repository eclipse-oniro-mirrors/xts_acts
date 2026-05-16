/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@system.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}
export default function Picker() {
    describe('Picker', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/crownSensitivity/Picker',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get Picker state pages: " + JSON.stringify(pages));
                if (!("Picker" == pages.name)) {
                    console.info("get Picker state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push Picker page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push Picker page error: " + err);
                expect().assertFail();
            }
            done();
        });

        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0100
         * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0100
         * @tc.desc   verifyBaseFunction.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_DatePicker_ComponentTest_0100', Level.LEVEL1, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0100] START');
          let strJson = getInspectorByKey('picker01');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0100] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0100] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0100] focusOnTouch: " + JSON.stringify(obj.$attrs.focusOnTouch));
          expect(obj.$attrs.digitalCrownSensitivity).assertEqual('2');
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0100] END');
          done();
        });

        /**
         * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0200
         * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0200
         * @tc.desc   verifyBaseFunction.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_DatePicker_ComponentTest_0200', Level.LEVEL1, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0200] START');
          let strJson = getInspectorByKey('picker02');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0200] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0200] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0200] focusable: " + JSON.stringify(obj.$attrs.focusable));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0200] focusOnTouch: " + JSON.stringify(obj.$attrs.focusOnTouch));

          expect(obj.$attrs.digitalCrownSensitivity).assertEqual('0');
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0200] END');
          done();
        });

        /**
         * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0300
         * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0300
         * @tc.desc   verifyBaseFunction.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_DatePicker_ComponentTest_0300', Level.LEVEL1, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0300] START');
          let strJson = getInspectorByKey('picker03');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0300] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0300] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0300] defaultFocus: " + JSON.stringify(obj.$attrs.defaultFocus));
          expect(obj.$attrs.digitalCrownSensitivity).assertEqual('1');
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0300] END');
          done();
        });

        /**
         * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0400
         * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0400
         * @tc.desc   verifyBaseFunction.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_DatePicker_ComponentTest_0400', Level.LEVEL1, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0400] START');
          let strJson = getInspectorByKey('picker04');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0400] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0400] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0400] defaultFocus: " + JSON.stringify(obj.$attrs.defaultFocus));
          expect(obj.$attrs.digitalCrownSensitivity).assertEqual('1');
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0400] END');
          done();
        });

        /**
         * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0500
         * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0500
         * @tc.desc   verifyBaseFunction.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('ArkUX_Stage_DatePicker_ComponentTest_0500', Level.LEVEL1, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0500] START');
          let strJson = getInspectorByKey('picker05');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0500] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0500] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
          console.info("[ArkUX_Stage_DatePicker_ComponentTest_0500] defaultFocus: " + JSON.stringify(obj.$attrs.defaultFocus));
          expect(obj.$attrs.digitalCrownSensitivity).assertEqual('1');
          console.info('[ArkUX_Stage_DatePicker_ComponentTest_0500] END');
          done();
        });

      /**
       * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0600
       * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0600
       * @tc.desc   verifyBaseFunction.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('ArkUX_Stage_DatePicker_ComponentTest_0600', Level.LEVEL1, async (done: Function) => {
        // Verify the functions of the ArcAlphabetIndexer component
        console.info('[ArkUX_Stage_DatePicker_ComponentTest_0600] START');
        let strJson = getInspectorByKey('picker06');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0600] attr: " + JSON.stringify(obj.$attrs));
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0600] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0600] defaultFocus: " + JSON.stringify(obj.$attrs.defaultFocus));
        expect(obj.$attrs.digitalCrownSensitivity).assertEqual('1');
        console.info('[ArkUX_Stage_DatePicker_ComponentTest_0600] END');
        done();
      });

      /**
       * @tc.name   ArkUX_Stage_DatePicker_ComponentTest_0700
       * @tc.number ArkUX_Stage_DatePicker_ComponentTest_0700
       * @tc.desc   verifyBaseFunction.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('ArkUX_Stage_DatePicker_ComponentTest_0700', Level.LEVEL1, async (done: Function) => {
        // Verify the functions of the ArcAlphabetIndexer component
        console.info('[ArkUX_Stage_DatePicker_ComponentTest_0700] START');
        let strJson = getInspectorByKey('picker07');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0700] attr: " + JSON.stringify(obj.$attrs));
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0700] digitalCrownSensitivity: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));
        console.info("[ArkUX_Stage_DatePicker_ComponentTest_0700] defaultFocus: " + JSON.stringify(obj.$attrs.defaultFocus));
        expect(obj.$attrs.digitalCrownSensitivity).assertEqual('1');
        console.info('[ArkUX_Stage_DatePicker_ComponentTest_0700] END');
        done();
      });
    })
}
