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

export default function imageOneJsunit() {
  describe('imageOneJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("imageOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageOneJsunit state pages:" + JSON.stringify(pages));
        if (!("imageOne" == pages.name)) {
          console.info("get imageOneJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push imageOneJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push imageOneJsunit page error:" + err);
	  expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   imageOneJsunit_0100
     * @tc.number imageOneJsunit_0100
     * @tc.desc   imageOneJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0100 component obj is: ' + obj.$attrs.src);
      expect(obj.$attrs.src).assertEqual('resource://rawfile/test3.png');

      let strJson2 = getInspectorByKey('objectFit');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textimageOneJsunit_0100 component obj2 is: ' + obj2.$attrs.objectFit);
      expect(obj2.$attrs.objectFit).assertEqual('ImageFit.None');

      let strJson3 = getInspectorByKey('repeat');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textimageOneJsunit_0100 component obj3 is: ' + obj3.$attrs.objectRepeat);
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.NoRepeat');
      done();
    });
    
    /**
     * @tc.name   imageOneJsunit_0200
     * @tc.number imageOneJsunit_0200
     * @tc.desc   imageOneJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image format
      globalThis.value.message.notify({name:'imageNamePng',value:'test2.svg'})
      await CommonFunc.sleep(1000); 
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0200 component obj is: ' + obj.$attrs.src);
      expect(obj.$attrs.src).assertEqual('resource://rawfile/test2.svg');
      
      globalThis.value.message.notify({name:'imageNamePng',value:'test.gif'})
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('image1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textimageOneJsunit_0200 component obj2 is: ' + obj2.$attrs.src);
      expect(obj2.$attrs.src).assertEqual('resource://rawfile/test.gif');

      globalThis.value.message.notify({name:'imageNamePng',value:'bm.bmp'})
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('image1');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textimageOneJsunit_0100 component obj3 is: ' + obj3.$attrs.src);
      expect(obj3.$attrs.src).assertEqual('resource://rawfile/bm.bmp');

      globalThis.value.message.notify({name:'imageNamePng',value:'bm.jpg'})
      await CommonFunc.sleep(1000); 
      let strJson4 = getInspectorByKey('image1');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('textimageOneJsunit_0100 component obj4 is: ' + obj4.$attrs.src);
      expect(obj4.$attrs.src).assertEqual('resource://rawfile/bm.jpg');
      done();
    });

    /**
     * @tc.name   imageOneJsunit_0300
     * @tc.number imageOneJsunit_0300
     * @tc.desc   imageOneJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image of not exit
      globalThis.value.message.notify({name:'imageNamePng',value:'aaa.png'})
      await CommonFunc.sleep(1000); 
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0300 component obj is: ' + obj.$attrs.src);
      expect(obj.$attrs.src).assertEqual('resource://rawfile/aaa.png');
      done();
    });

   /**
    * @tc.name   imageOneJsunit_0400
    * @tc.number imageOneJsunit_0400
    * @tc.desc   imageOneJsunit_0400
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('imageOneJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of objectFit
      globalThis.value.message.notify({name:'objectFit',value:ImageFit.Cover})
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('objectFit');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0400 component obj is: ' + obj.$attrs.objectFit);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover');

      globalThis.value.message.notify({name:'objectFit',value:ImageFit.Auto})
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('objectFit');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textimageOneJsunit_0400 component obj2 is: ' + obj2.$attrs.objectFit);
      expect(obj2.$attrs.objectFit).assertEqual('ImageFit.Auto');

      globalThis.value.message.notify({name:'objectFit',value:ImageFit.Fill})
      await CommonFunc.sleep(500);
      let strJson3 = getInspectorByKey('objectFit');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textimageOneJsunit_0400 component obj3 is: ' + obj3.$attrs.objectFit);
      expect(obj3.$attrs.objectFit).assertEqual('ImageFit.Fill');

      globalThis.value.message.notify({name:'objectFit',value:ImageFit.ScaleDown})
      await CommonFunc.sleep(500);
      let strJson4 = getInspectorByKey('objectFit');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('textimageOneJsunit_0400 component obj4 is: ' + obj4.$attrs.objectFit);
      expect(obj4.$attrs.objectFit).assertEqual('ImageFit.ScaleDown');

      globalThis.value.message.notify({name:'objectFit',value:ImageFit.None})
      await CommonFunc.sleep(500);
      let strJson5 = getInspectorByKey('objectFit');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('textimageOneJsunit_0400 component obj5 is: ' + obj5.$attrs.objectFit);
      expect(obj5.$attrs.objectFit).assertEqual('ImageFit.None');

      globalThis.value.message.notify({name:'objectFit',value:ImageFit.Contain})
      await CommonFunc.sleep(500);
      let strJson6 = getInspectorByKey('objectFit');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info('textimageOneJsunit_0400 component obj6 is: ' + obj6.$attrs.objectFit);
      expect(obj6.$attrs.objectFit).assertEqual('ImageFit.Contain');
      done();
    });
  
    /**
     * @tc.name   imageOneJsunit_0500
     * @tc.number imageOneJsunit_0500
     * @tc.desc   imageOneJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal enum of objectFit
      globalThis.value.message.notify({name:'objectFit',value:9})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0500 component obj is: ' + obj.$attrs.objectFit);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover');
      done();
    });

    /**
     * @tc.name   imageOneJsunit_0600
     * @tc.number imageOneJsunit_0600
     * @tc.desc   imageOneJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // test the enum of ImageRepeat
      globalThis.value.message.notify({name:'objectRepeat',value:ImageRepeat.X})
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0600 component obj is: ' + obj.$attrs.objectRepeat);
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.X');

      globalThis.value.message.notify({name:'objectRepeat',value:ImageRepeat.Y})
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('repeat');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('textimageOneJsunit_0600 component obj1 is: ' + obj1.$attrs.objectRepeat);
      expect(obj1.$attrs.objectRepeat).assertEqual('ImageRepeat.Y');

      globalThis.value.message.notify({name:'objectRepeat',value:ImageRepeat.XY})
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('repeat');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('textimageOneJsunit_0600 component obj2 is: ' + obj2.$attrs.objectRepeat);
      expect(obj2.$attrs.objectRepeat).assertEqual('ImageRepeat.XY');

      globalThis.value.message.notify({name:'objectRepeat',value:ImageRepeat.NoRepeat})
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('repeat');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('textimageOneJsunit_0600 component obj3 is: ' + obj3.$attrs.objectRepeat);
      expect(obj3.$attrs.objectRepeat).assertEqual('ImageRepeat.NoRepeat');
      done();
    });

    /**
     * @tc.name   imageOneJsunit_0700
     * @tc.number imageOneJsunit_0700
     * @tc.desc   imageOneJsunit_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageOneJsunit_0700', Level.LEVEL1, async (done: Function) => {
      console.info('imageOneJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // test the illegal enum of ImageRepeat
      globalThis.value.message.notify({name:'objectRepeat',value:undefined})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('repeat');
      let obj: ESObject = JSON.parse(strJson);
      console.info('textimageOneJsunit_0700 component obj is: ' + obj.$attrs.objectRepeat);
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.NoRepeat');
      done();
    });
  })
}
