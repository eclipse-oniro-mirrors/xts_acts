// @ts-nocheck
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function ImageJsunit() {
  describe('imageTest', function () {
    beforeEach(async function (done) {
      console.info("image beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/imagePage',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get image state pages: " + JSON.stringify(pages));
        if (!("imagePage" == pages.name)) {
          console.info("get image pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push image page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push image page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("image after each called");
    })
    /**
     * @tc.number testImageAlt01
     * @tc.name   Test the ImageAlt property of the image component
     * @tc.desc   set the ImageAlt property value is string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageAlt01', 0, async function (done) {
      var tagName = 'testImageAlt01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.alt).assertEqual("/test/assert/icon.png");

      try {
        var eventData = {
          data: {
            "altValue": "/test/assert/bg.png"
          }
        }
        var innerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.alt).assertEqual("/test/assert/bg.png");
      expect(objNew.$type).assertEqual('Image');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageAutoResize02
     * @tc.name   Test the ImageAutoResize property of the image component
     * @tc.desc   set the ImageAutoResize property value is bool
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageAutoResize02', 0, async function (done) {
      var tagName = 'testImageAutoResize02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.autoResize).assertEqual("true");

      try {
        var eventData = {
          data: {
            "autoResizeValue": false
          }
        }
        var innerEvent = {
          eventId: 6802,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.autoResize).assertEqual("false");
      expect(objNew.$type).assertEqual('Image');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageColorFilter03
     * @tc.name   Test the ImageColorFilter property of the image component
     * @tc.desc   set the ImageColorFilter property value is string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageColorFilter03', 0, async function (done) {
      var tagName = 'testImageColorFilter03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.alt).assertEqual("/test/assert/bg.png")
   
      try {
        var eventData = {
          data: {
            "colorFilterValue": "colorFilterValueType001"
          }
        }
        var innerEvent = {
          eventId: 6803,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      
      expect(objNew.$attrs.colorFilter).assertEqual("1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageCopyOption04
     * @tc.name   Test the ImageCopyOption property of the image component
     * @tc.desc   set the ImageCopyOption property value is CopyOptions
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageCopyOption04', 0, async function (done) {
      var tagName = 'testImageCopyOption04';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.None");

      try {
        var eventData = {
          data: {
            "copyOptionsValue":  CopyOptions.LocalDevice,
          }
        }
        var innerEvent = {
          eventId: 6804,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.Local");
      expect(objNew.$type).assertEqual('Image');

      try {
        var eventData2 = {
          data: {
            "copyOptionsValue":  CopyOptions.CROSS_DEVICE,
          }
        }
        var innerEvent2 = {
          eventId: 6805,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keyImage');
      let objNew2 = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + objNew2);
      expect(objNew2.$attrs.copyOption).assertEqual("CopyOptions.Distributed");
      expect(objNew2.$type).assertEqual('Image');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageDraggable05
     * @tc.name   Test the ImageDraggable property of the image component
     * @tc.desc   set the ImageDraggable property value is bool
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageDraggable05', 0, async function (done) {
      var tagName = 'testImageDraggable05';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.draggable).assertEqual("false");

      try {
        var eventData = {
          data: {
            "draggableValue": true,
          }
        }
        var innerEvent = {
          eventId: 6806,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.draggable).assertEqual("true");
      expect(objNew.$type).assertEqual('Image');
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageFillColor06
     * @tc.name   Test the ImageFillColor property of the image component
     * @tc.desc   set the ImageFillColor property value is Color
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageFillColor06', 0, async function (done) {
      var tagName = 'testImageFillColor06';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.fillColor).assertEqual("#FF007DFF");

      try {
        var eventData = {
          data: {
            "fillColorValue": Color.Orange,
          }
        }
        var innerEvent = {
          eventId: 6807,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.fillColor).assertEqual("#FFFFA500");
      expect(objNew.$type).assertEqual('Image');
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageFitOriginalSize07
     * @tc.name   Test the ImageFitOriginalSize property of the image component
     * @tc.desc   set the ImageFitOriginalSize property value is bool
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageFitOriginalSize07', 0, async function (done) {
      var tagName = 'testImageFitOriginalSize07';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.fitOriginalSize).assertEqual("false");

      try {
        var eventData = {
          data: {
            "fitOriginalSizeValue" : true
          }
        }
        var innerEvent = {
          eventId: 6808,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.fitOriginalSize).assertEqual("true");
      expect(objNew.$type).assertEqual('Image');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageInterpolation08
     * @tc.name   Test the ImageInterpolation property of the image component
     * @tc.desc   set the ImageInterpolation property value is ImageInterpolation
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageInterpolation08', 0, async function (done) {
      var tagName = 'testImageInterpolation08';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.interpolation).assertEqual("ImageInterpolation.None");

      try {
        var eventData = {
          data: {
            "interpolationValue": ImageInterpolation.Low
          }
        }
        var innerEvent = {
          eventId: 6809,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.interpolation).assertEqual("ImageInterpolation.Low");
      expect(objNew.$type).assertEqual('Image');

      try {
        var eventData2 = {
          data: {
            "interpolationValue": ImageInterpolation.Medium
          }
        }
        var innerEvent2 = {
          eventId: 6810,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keyImage');
      let objNew2 = JSON.parse(strJsonNew2);
      console.info('[' + tagName + '] component objNew is: ' + objNew2);
      
      expect(objNew2.$attrs.interpolation).assertEqual("ImageInterpolation.Medium");
      expect(objNew2.$type).assertEqual('Image');

      try {
        var eventData3 = {
          data: {
            "interpolationValue": ImageInterpolation.High
          }
        }
        var innerEvent3 = {
          eventId: 6811,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew3 = getInspectorByKey('keyImage');
      let objNew3 = JSON.parse(strJsonNew3);
      console.info('[' + tagName + '] component objNew is: ' + objNew3);
      
      expect(objNew3.$attrs.interpolation).assertEqual("ImageInterpolation.High");
      expect(objNew3.$type).assertEqual('Image');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageMatchTextDirection09
     * @tc.name   Test the ImageMatchTextDirection property of the image component
     * @tc.desc   set the ImageMatchTextDirection property value is bool
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testImageMatchTextDirection09', 0, async function (done) {
      var tagName = 'testImageMatchTextDirection09';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.matchTextDirection).assertEqual("false");

      try {
        var eventData = {
          data: {
            "matchTextDirectionValue": true
          }
        }
        var innerEvent = {
          eventId: 6812,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      let objNew = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + objNew);
      
      expect(objNew.$attrs.matchTextDirection).assertEqual("true");
      expect(objNew.$type).assertEqual('Image');
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageObjectFit10
     * @tc.name   Test the ImageObjectFit property of the image component
     * @tc.desc   set the ImageObjectFit property value is ImageFit
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */   
    it('testImageObjectFit10', 0, async function (done) {
      var tagName = 'testImageObjectFit10';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.objectFit).assertEqual("ImageFit.Cover");

      try {
        var eventData = {
          data: {
            "objectFitValue": ImageFit.Contain
          }
        }
        var innerEvent = {
          eventId: 6813,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      let objNew = JSON.parse(strJsonNew);
      expect(objNew.$attrs.objectFit).assertEqual("ImageFit.Contain");
      expect(objNew.$type).assertEqual('Image');

      try {
        var eventData2 = {
          data: {
            "objectFitValue": ImageFit.Auto
          }
        }
        var innerEvent2 = {
          eventId: 6814,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);
      let objNew2 = JSON.parse(strJsonNew2);
      expect(objNew2.$attrs.objectFit).assertEqual("ImageFit.Auto");
      expect(objNew2.$type).assertEqual('Image');

      try {
        var eventData3 = {
          data: {
            "objectFitValue": ImageFit.Fill
          }
        }
        var innerEvent3 = {
          eventId: 6815,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew3 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew3);
      let objNew3 = JSON.parse(strJsonNew3);
      expect(objNew3.$attrs.objectFit).assertEqual("ImageFit.Fill");
      expect(objNew3.$type).assertEqual('Image');

      try {
        var eventData4 = {
          data: {
            "objectFitValue": ImageFit.ScaleDown
          }
        }
        var innerEvent4 = {
          eventId: 6816,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent4, eventData4);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew4 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew4);
      let objNew4 = JSON.parse(strJsonNew4);
      expect(objNew4.$attrs.objectFit).assertEqual("ImageFit.ScaleDown");
      expect(objNew4.$type).assertEqual('Image');
      
      try {
        var eventData5 = {
          data: {
            "objectFitValue": ImageFit.None
          }
        }
        var innerEvent5 = {
          eventId: 6817,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent5, eventData5);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew5 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew5);
      let objNew5 = JSON.parse(strJsonNew5);
      expect(objNew5.$attrs.objectFit).assertEqual("ImageFit.None");
      expect(objNew5.$type).assertEqual('Image');
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageObjectRepeat11
     * @tc.name   Test the ImageObjectRepeat property of the image component
     * @tc.desc   set the ImageObjectRepeat property value is ImageRepeat
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */  
    it('testImageObjectRepeat11', 0, async function (done) {
      var tagName = 'testImageObjectRepeat11';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.objectRepeat).assertEqual("ImageRepeat.NoRepeat");

      try {
        var eventData = {
          data: {
            "objectRepeatValue": ImageRepeat.X
          }
        }
        var innerEvent = {
          eventId: 6818,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      let objNew = JSON.parse(strJsonNew);
      expect(objNew.$attrs.objectRepeat).assertEqual("ImageRepeat.X");
      expect(objNew.$type).assertEqual('Image');

      try {
        var eventData2 = {
          data: {
            "objectRepeatValue": ImageRepeat.Y
          }
        }
        var innerEvent2 = {
          eventId: 6819,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent2, eventData2);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew2 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew2);
      let objNew2 = JSON.parse(strJsonNew2);
      expect(objNew2.$attrs.objectRepeat).assertEqual("ImageRepeat.Y");
      expect(objNew2.$type).assertEqual('Image');

      try {
        var eventData3 = {
          data: {
            "objectRepeatValue": ImageRepeat.XY
          }
        }
        var innerEvent3 = {
          eventId: 6820,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew3 = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew3);
      let objNew3 = JSON.parse(strJsonNew3);
      expect(objNew3.$attrs.objectRepeat).assertEqual("ImageRepeat.XY");      
      expect(objNew3.$type).assertEqual('Image');
      
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageRenderMode12
     * @tc.name   Test the ImageRenderMode property of the image component
     * @tc.desc   set the ImageRenderMode property value is ImageRenderMode
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */  
    it('testImageRenderMode12', 0, async function (done) {
      var tagName = 'testImageRenderMode12';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Original');

      try {
        var eventData = {
          data: {
            "renderModeValue": ImageRenderMode.Template
          }
        }
        var innerEvent = {
          eventId: 6821,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      let objNew = JSON.parse(strJsonNew);
      expect(objNew.$attrs.renderMode).assertEqual("ImageRenderMode.Template");
      expect(objNew.$type).assertEqual('Image');
     
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageSourceSize13
     * @tc.name   Test the ImageSourceSize property of the image component
     * @tc.desc   set the ImageSourceSize property value is string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */  
    it('testImageSourceSize13', 0, async function (done) {
      var tagName = 'testImageSourceSize13';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.sourceSize).assertEqual('[350.00 x 350.00]');

      try {
        var eventData = {
          data: {
            "sourceSizeValue": "sourceSizeValueType001"
          }
        }
        var innerEvent = {
          eventId: 6822,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      let objNew = JSON.parse(strJsonNew);
      expect(objNew.$attrs.sourceSize).assertEqual('[350.00 x 350.00]');
      expect(objNew.$type).assertEqual('Image');
     
      console.info('[' + tagName + '] END ===========================');
      done();
    });
    /**
     * @tc.number testImageSyncLoad14
     * @tc.name   Test the ImageSyncLoad property of the image component
     * @tc.desc   set the ImageSyncLoad property value is bool
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */  
    it('testImageSyncLoad14', 0, async function (done) {
      var tagName = 'testImageSyncLoad14';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component obj is: ' + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Image');
      expect(obj.$attrs.syncLoad).assertEqual("false");

      try {
        var eventData = {
          data: {
            "syncLoadValue": true
          }
        }
        var innerEvent = {
          eventId: 6823,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('keyImage');
      console.info('[' + tagName + '] component objNew is: ' + strJsonNew);
      let objNew = JSON.parse(strJsonNew);
      expect(objNew.$attrs.syncLoad).assertEqual("true");
      expect(objNew.$type).assertEqual('Image');
     
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
