/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
const waitUiReadyMs = 1000;

export default function imageTwoJsunit() {
  describe('imageTwoJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("imageTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get imageTwoJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push imageTwoJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push imageTwoJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   imageTwoJsunit_0100
     * @tc.number imageTwoJsunit_0100
     * @tc.desc   imageTwoJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageTwoJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('imageTwoJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageTwoJsunit_0100 component obj is: ' + obj.$attrs.renderMode + "--" + obj.$attrs.interpolation + "--" + obj.$attrs.fillColor + "---" +
      obj.$attrs.autoResize + "---" + obj.$attrs.syncLoad + "----" + obj.$attrs.copyOption + "--" + obj.$attrs.colorFilter + "--" + obj.$attrs.draggable);
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Original');
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
      expect(obj.$attrs.fillColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.autoResize).assertEqual('true');
      expect(obj.$attrs.syncLoad).assertEqual('false');
      expect(obj.$attrs.copyOption).assertEqual('CopyOptions.InApp');
      expect(obj.$attrs.colorFilter).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ' +
      '1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 ' +
      '0.000000 1.000000 0.000000 ');
      expect(obj.$attrs.draggable).assertEqual('false');
      done();
    });

    /**
     * @tc.name   imageTwoJsunit_0200
     * @tc.number imageTwoJsunit_0200
     * @tc.desc   imageTwoJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageTwoJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode
      globalThis.value.message.notify({name:'renderMode',value:ImageRenderMode.Template})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageTwoJsunit_0200 component obj is: ' + obj.$attrs.renderMode);
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Template');
      done();
    });

    /**
     * @tc.name   imageTwoJsunit_0300
     * @tc.number imageTwoJsunit_0300
     * @tc.desc   imageTwoJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageTwoJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('imageTwoJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode
      globalThis.value.message.notify({name:'renderMode',value:undefined})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageTwoJsunit_0300 component obj is: ' + obj.$attrs.renderMode);
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Original');
      done();
    });

   /**
    * @tc.name   imageTwoJsunit_0400
    * @tc.number imageTwoJsunit_0400
    * @tc.desc   imageTwoJsunit_0400
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('imageTwoJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('imageTwoJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      globalThis.value.message.notify({name:'interpolation',value:ImageInterpolation.Low})
      await CommonFunc.sleep(300);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageTwoJsunit_0300  component obj is: ' + obj.$attrs.interpolation);
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');

      globalThis.value.message.notify({name:'interpolation',value:ImageInterpolation.Medium})
      await CommonFunc.sleep(300);
      let strJson2 = getInspectorByKey('image1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('imageTwoJsunit_0400  component obj2 is: ' + obj2.$attrs.interpolation);
      expect(obj2.$attrs.interpolation).assertEqual('ImageInterpolation.Medium');

      globalThis.value.message.notify({name:'interpolation',value:ImageInterpolation.High})
      await CommonFunc.sleep(300);
      let strJson3 = getInspectorByKey('image1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('imageTwoJsunit_0400  component obj3 is: ' + obj3.$attrs.interpolation);
      expect(obj3.$attrs.interpolation).assertEqual('ImageInterpolation.High');
      done();
    });

    /**
     * @tc.name   imageTwoJsunit_0500
     * @tc.number imageTwoJsunit_0500
     * @tc.desc   imageTwoJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageTwoJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('imageTwoJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      globalThis.value.message.notify({name:'interpolation',value:undefined})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageTwoJsunit_0500  component obj is: ' + obj.$attrs.interpolation);
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
      done();
    });

    /**
     * @tc.name   imageTwoJsunit_0600
     * @tc.number imageTwoJsunit_0600
     * @tc.desc   imageTwoJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageTwoJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0600 START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'fillColor',value:"#FFEEAA"})
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('imageOneJsunit_0600 component obj is: ' + obj.$attrs.fillColor);
      expect(obj.$attrs.fillColor).assertEqual('#FFFFEEAA');

      globalThis.value.message.notify({name:'fillColor',value:"rgb(238, 130, 238)"})
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('image1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('imageTwoJsunit_0600  component obj2 is: ' + obj2.$attrs.fillColor);
      expect(obj2.$attrs.fillColor).assertEqual('#FFEE82EE');

      globalThis.value.message.notify({name:'fillColor',value:Color.Green})
      await CommonFunc.sleep(2000);
      let strJson3 = getInspectorByKey('image1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('imageTwoJsunit_0600  component obj3 is: ' + obj3.$attrs.fillColor);
      expect(obj3.$attrs.fillColor).assertEqual('#FF008000');
      done();
    });
  })
}