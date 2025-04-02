/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import { EventType } from '../MainAbility/common/Common';
import { Component, Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import {
  PhotoPickerComponent,
  PickerController,
  PickerOptions,
  DataType,
  PickerColorMode,
  MaxSelected,
  MaxCountType,
  ItemInfo,
  ReminderMode,
  SelectMode,
  PickerOrientation,
  PhotoBrowserInfo,
  ClickType,
  BaseItemInfo,
  SaveMode,
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { PhotoPickerResult } from '../MainAbility/common/PhotoPickerResult'
import {
  RecentPhotoOptions,
  PhotoSource,
} from '@ohos.file.RecentPhotoComponent';
import { fileUri } from '@kit.CoreFileKit';

async function routeToUrl(options: router.RouterOptions) {
  try {
    router.clear();
    let pages: router.RouterState = router.getState();
    console.info("testPicker state pages:" + JSON.stringify(pages));
    if (!("PickerComponent" == pages.name)) {
      console.info("testPicker state pages.name:" + JSON.stringify(pages.name));
      let result = await router.pushUrl(options);
      await CommonFunc.sleep(2000);
    }
  } catch (err) {
    console.error("testPicker page error:" + err);
  }
}

function getDefaultPickerOptions(): PickerOptions {
  let pickerOptions: PickerOptions = new PickerOptions();
  pickerOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
  pickerOptions.isSearchSupported = false;
  pickerOptions.isPhotoTakingSupported = false;
  pickerOptions.isRepeatSelectSupported = false;
  pickerOptions.maxSelectNumber = 500;
  pickerOptions.maxSelectedReminderMode = ReminderMode.TOAST;
  pickerOptions.maxPhotoSelectNumber = 500;
  pickerOptions.maxVideoSelectNumber = 500;
  pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.AUTO;
  pickerOptions.orientation = PickerOrientation.HORIZONTAL;
  return pickerOptions;
}

async function clickResultButton(driver: Driver) {
  console.info("testPicker create");
  let btn = await driver.findComponent(ON.id('resultButton'));
  console.info("testPicker findComponent resultButton succsess");
  if (btn === null) {
    console.info('no button');
    return;
  }
  await btn.click();
  console.info("testPicker btn click finish");
}

async function clickAlbumButton(driver: Driver) {
  console.info("testpicker create");
  let btn = await driver.findComponent(ON.id('albumButton'));
  await btn.click();
  console.info('testPicker btn click finish');
  await CommonFunc.sleep(1000);
  let albumItem = await driver.findComponent((ON.id('AlbumListItem')));
  if (albumItem === null) {
    console.info('no ListItem');
    return;
  }
  console.info("testPicker findComponent ListItem success");
  await albumItem.click();
}

async function clickBigPicture(driver: Driver) {
  console.info("testpicker create");
  let btn = await driver.findComponent(ON.type('Image'));
  if (btn === null) {
    console.info('no Image');
    return;
  }
  await btn.click();
  console.info('testPicker btn click finish');
  await CommonFunc.sleep(1000);
}

async function testCompleteButton(driver: Driver, options: router.RouterOptions, textMode: number) {
  let buttonText: string = '';
  switch (textMode) {
    case 0:
      buttonText = 'TEXT_DONE';
      break;
    case 1:
      buttonText = 'TEXT_SEND';
      break;
    case 2:
      buttonText = 'TEXT_ADD';
      break;
    default:
      buttonText = 'TEXT_DONE';
      break;
  }
  await routeToUrl(options);
  let chooostModeButton: Component = await driver.findComponent(ON.text(buttonText));
  let button: Component = await driver.findComponent(ON.text('select photo'));
  if (button !== undefined && chooostModeButton !== undefined) {
    await chooostModeButton.click();
    await button.click();
    expect(true).assertTrue();
  } else {
    console.error("can not find button");
    expect(false).assertTrue();
  }
  await CommonFunc.sleep(1000);
  router.back();
}

export default function TextPicker() {
  describe('testPicker', () => {
    let driver: Driver;
    beforeEach(async (done: Function) => {
      console.info("testPicker beforeEach start");
      driver = Driver.create();
      await CommonFunc.sleep(5000);
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });


    /* *
     * @tc.number    : testPicker01
     * @tc.name      : testPicker01
     * @tc.desc      : Testing route to PhotoPickerComponent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPicker01', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.checkBoxColor = '#000000';
      let callback = (event: events_emitter.EventData) => {
        let expectResult: String = pickerOptions.checkBoxColor ?? '';
        let result: PhotoPickerResult = event?.data?.msg.checkBoxColor;
        console.info('testPicker01 result event.data.msg=:' + result);
        console.info('testPicker01 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker01 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      events_emitter.off(event.eventId);
      console.info("testPicer01 finish");
      done();
    });

    /* *
     * @tc.number    : testPicker02
     * @tc.name      : testPicker02
     * @tc.desc      : Testing Change PhotoPickerComponent BackgroundColor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker02', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.backgroundColor = '#000000';
      let callback = (event: events_emitter.EventData) => {
        let expectResult: String = pickerOptions.backgroundColor ?? '';
        let result: PhotoPickerResult = event?.data?.msg.backgroundColor;
        console.info('testPicker02 result event.data.msg=:' + result);
        console.info('testPicker02 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker01 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer02 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
     * @tc.number    : testPicker03
     * @tc.name      : testPicker03
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's isRepeatSelectSupported property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker03', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.isRepeatSelectSupported = true;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: boolean = pickerOptions.isRepeatSelectSupported ?? false;
        let result: PhotoPickerResult = event?.data?.msg.isRepeatSelectSupported;
        console.info('testPicker03 result event.data.msg=:' + result);
        console.info('testPicker03 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker03 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer03 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
   * @tc.number    : testPicker04
   * @tc.name      : testPicker04
   * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's checkboxTextColor property
   * @tc.size      : MediumTest
   * @tc.type      : Function
   * @tc.level     : Level1
   */
    it('testPicker04', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.checkboxTextColor = '#000000';
      let callback = (event: events_emitter.EventData) => {
        let expectResult: String = pickerOptions.checkboxTextColor ?? '';
        let result: PhotoPickerResult = event?.data?.msg.checkboxTextColor;
        console.info('testPicker04 result event.data.msg=:' + result);
        console.info('testPicker04 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker04 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer04 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
     * @tc.number    : testPicker05
     * @tc.name      : testPicker05
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker05', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.LIGHT;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.photoBrowserBackgroundColorMode ?? PickerColorMode.AUTO;
        let result: PhotoPickerResult = event?.data?.msg.photoBrowserBackgroundColorMode;
        console.info('testPicker05 result event.data.msg=:' + result);
        console.info('testPicker05 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker05 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer05 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
     * @tc.number    : testPicker06
     * @tc.name      : testPicker06
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker06', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.photoBrowserBackgroundColorMode = PickerColorMode.DARK;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.photoBrowserBackgroundColorMode ?? PickerColorMode.AUTO;
        let result: PhotoPickerResult = event?.data?.msg.photoBrowserBackgroundColorMode;
        console.info('testPicker06 result event.data.msg=:' + result);
        console.info('testPicker06 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker06 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer06 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
     * @tc.number    : testPicker07
     * @tc.name      : testPicker07
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testPicker07', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectedReminderMode = ReminderMode.NONE;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.maxSelectedReminderMode ?? ReminderMode.TOAST;
        let result: PhotoPickerResult = event?.data?.msg.maxSelectedReminderMode;
        console.info('testPicker07 result event.data.msg=:' + result);
        console.info('testPicker07 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker07 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer07 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker08
    * @tc.name      : testPicker08
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */
    it('testPicker08', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectedReminderMode = ReminderMode.MASK;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.maxSelectedReminderMode ?? ReminderMode.TOAST;
        let result: PhotoPickerResult = event?.data?.msg.maxSelectedReminderMode;
        console.info('testPicker08 result event.data.msg=:' + result);
        console.info('testPicker08 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker08 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer08 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker09
    * @tc.name      : testPicker09
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's selectMode property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */
    it('testPicker09', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.selectMode = SelectMode.SINGLE_SELECT;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.selectMode ?? SelectMode.MULTI_SELECT;
        let result: PhotoPickerResult = event?.data?.msg.SelectMode;
        console.info('testPicker09 result event.data.msg=:' + result);
        console.info('testPicker09 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker09 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer09 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker10
    * @tc.name      : testPicker10
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxPhotoSelectNumber property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level1
    */
    it('testPicker10', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxPhotoSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.maxPhotoSelectNumber ?? 500;
        let result: PhotoPickerResult = event?.data?.msg.maxPhotoSelectNumber;
        console.info('testPicker10 result event.data.msg=:' + result);
        console.info('testPicker10 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker10 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer10 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker11
    * @tc.name      : testPicker11
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxVideoSelectNumber property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level1
    */
    it('testPicker11', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxVideoSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.maxVideoSelectNumber ?? 500;
        let result: PhotoPickerResult = event?.data?.msg.maxVideoSelectNumber;
        console.info('testPicker11 result event.data.msg=:' + result);
        console.info('testPicker11 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker11 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer11 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker12
    * @tc.name      : testPicker12
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectNumber property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level1
    */
    it('testPicker12', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectNumber = 8;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.maxSelectNumber ?? 500;
        let result: PhotoPickerResult = event?.data?.msg.maxSelectCount;
        console.info('testPicker12 result event.data.msg=:' + result);
        console.info('testPicker12 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker12 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer12 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker13
    * @tc.name      : testPicker13
    * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's orientation property
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level2
    */
    it('testPicker13', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.orientation = PickerOrientation.VERTICAL;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = PickerOrientation.VERTICAL ?? PickerOrientation.HORIZONTAL;
        let result: PhotoPickerResult = event?.data?.msg.orientation;
        console.info('testPicker13 result event.data.msg=:' + result);
        console.info('testPicker13 result expect =:' + expectResult);
        expect(result).assertEqual(expectResult);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker13 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicer13 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker14
    * @tc.name      : testPicker14
    * @tc.desc      : Testing ItemInfo's all properties
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level0
    */
    it('testPicker14', 0, async (done: Function) => {
      let code: number = EventType.SELECT_ITEM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: ItemInfo = event?.data?.msg;
        console.info('testPicker14 select ItemInfo=:' + JSON.stringify(result));
        expect(result.itemType).not().assertUndefined();
        expect(result.uri).not().assertUndefined();
        expect(result.mimeType).not().assertUndefined();
        expect(result.width).not().assertUndefined();
        expect(result.height).not().assertUndefined();
        expect(result.size).not().assertUndefined();
        expect(result.duration).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker14 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);

      let checkBoxs: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info("testPicker14 findComponent checkbox fail");
      } else {
        console.info("testPicker14 findComponent checkbox success");
        await checkBoxs[0].click();
        await CommonFunc.sleep(2000);
        console.info("testPicker14 btn click finish");
      }
      router.back();
      console.info("testPicer14 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
    * @tc.number    : testPicker15
    * @tc.name      : testPicker15
    * @tc.desc      : Testing MaxSelected
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level1
    */
    it('testPicker15', 0, async (done: Function) => {
      let code: number = EventType.SELECT_ITEM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let selectCount: number = 0;
      let callback = (event: events_emitter.EventData) => {
        let result: ItemInfo = event?.data?.msg;
        selectCount++;
        console.info('testPicker15 select ItemInfo=:' + JSON.stringify(result));
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      await CommonFunc.sleep(2000);

      let changeNumButton: Component = await driver.findComponent(ON.id('changeNumButton'));
      await changeNumButton.click();
      let checkBoxs: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info("testPicker15 findComponent checkbox fail");
      } else {
        console.info("testPicker15 findComponent checkbox success");
        let selectNum = Math.min(checkBoxs.length, 3);
        for (let index = 0; index < selectNum; index++) {
          await checkBoxs[index].click();
        }
        await CommonFunc.sleep(1000);
		expect(selectCount).assertLessOrEqual(1);
        console.info("testPicker15 btn click finish");
      }

      router.back();
      console.info("testPicer15 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker16
     * @tc.name      : testPicker16
     * @tc.desc      : Testing Album
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker16', 0, async (done: Function) => {
      let code: number = EventType.ALBUM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
      albumOptions.themeColorMode = PickerColorMode.DARK;
      albumOptions.filterType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      let callback = (event: events_emitter.EventData) => {
        let result: ItemInfo = event?.data?.msg;
        console.info('testPicker16 select ItemInfo=:' + JSON.stringify(result));
        expect(result.uri).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
          albumOptions: albumOptions
        }
      }
      await routeToUrl(options);

      console.info('testPicker16 create');
      await clickAlbumButton(driver);

      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker13 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicer15 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker17
     * @tc.name      : testPicker17
     * @tc.desc      : Testing PhotoBrowerInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker17', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: PhotoBrowserInfo = event?.data?.msg;
        console.info('testPicker17 select PhotoBrowerInfo=:' + JSON.stringify(result));
        expect(result.animatorParams).not().assertUndefined();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);

      console.info('testPicker17 create');

      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker17 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicer17 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker18
     * @tc.name      : testPicker18
     * @tc.desc      : Testing PhotoBrowerInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker18', 0, async (done: Function) => {
      let code: number = EventType.SELECT_CLICKTYPE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let clicked: boolean = false;
      let callback = (event: events_emitter.EventData) => {
        let result: number = event?.data?.msg;
        console.info('testPicker18 select number =:' + JSON.stringify(result));
        if (clicked) {
          expect(result).assertEqual(ClickType.DESELECTED);
        } else {
          expect(result).assertEqual(ClickType.SELECTED);
        }
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker18 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicer18 finish");
      events_emitter.off(event.eventId);
      done();
    });


    /**
     * @tc.number    : testPicker19
     * @tc.name      : testPicker19
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.ALL)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker19', 0, async (done: Function) => {
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker19 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.uri).not().assertEqual('');
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        }
      }
      await routeToUrl(options);
      console.info('testPicker19 create');
      let component: Component = await driver.findComponent(ON.id('recentPhoto'));
	  if (component === null) {
        console.info('testPicker19 no recentPhoto');
      } else {
	    await component.click();
        await CommonFunc.sleep(2000);
	  }
      router.back();
      console.info("testPicer19 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker20
     * @tc.name      : testPicker20
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.CAMERA)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker20', 0, async (done: Function) => {
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.CAMERA;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker20 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.uri).not().assertEqual('');
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        }
      }
      await routeToUrl(options);
      console.info('testPicker20 create');
      let component: Component = await driver.findComponent(ON.id('recentPhoto'));
	  if (component === null) {
        console.info('testPicker20 no recentPhoto');
      } else {
	    await component.click();
        await CommonFunc.sleep(2000);
	  }
      router.back();
      console.info("testPicer20 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker21
     * @tc.name      : testPicker21
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.SCREENSHOT)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testPicker21', 0, async (done: Function) => {
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.SCREENSHOT;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker21 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
        expect(baseItemInfo.uri).not().assertEqual('');
        expect(baseItemInfo.mimeType).not().assertUndefined();
        expect(baseItemInfo.width).not().assertUndefined();
        expect(baseItemInfo.height).not().assertUndefined();
        expect(baseItemInfo.size).not().assertUndefined();
        expect(baseItemInfo.duration).not().assertUndefined();
        done();
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RecentPhotoDemo',
        params: {
          eventId: code,
          recentPhotoOptions: recentPhotoOptions,
        }
      }
      await routeToUrl(options);
      console.info('testPicker21 create');
      let component: Component = await driver.findComponent(ON.id('recentPhoto'));
	  if (component === null) {
        console.info('testPicker21 no recentPhoto');
      } else {
	    await component.click();
        await CommonFunc.sleep(2000);
	  }
      router.back();
      console.info("testPicer21 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /* *
       * @tc.number    : testPicker22
       * @tc.name      : testPicker22
       * @tc.desc      : Testing PhotoPickerComponent set browser back button and checkbox
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker22', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      // 支持滑动多选
      pickerOptions.isSlidingSelectionSupported = true;
      // 设置大图页checkbox位置
      pickerOptions.photoBrowserCheckboxPosition = [0.5, 0.5];
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker22 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicer22 finish");
      done();
    });

        /* *
       * @tc.number    : testPicker23
       * @tc.name      : testPicker23
       * @tc.desc      : Testing requestPhotoUrisReadPermission
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker23', 0, async (done: Function) => {
      let uris = ['file://media/photo/test.jpg'];
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try {
        phAccessHelper.requestPhotoUrisReadPermission(uris).then((result: Array<string>) => {
          console.info("requestPhotoUrisReadPermission, result = " + JSON.stringify(result));
          if (result) {
            expect(true).assertTrue();
          } else {
            console.error("testPicker23 empty result");
            expect(false).assertTrue();
          }
        })
      } catch(error) {
        console.error("testPicer23 error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info("testPicer23 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker24
       * @tc.name      : testPicker24
       * @tc.desc      : Testing CompleteButtonText
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker24', 0, async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
      }
      
      for (let index = 0; index < 3; index++) {
        await testCompleteButton(driver, options, index);
      }

      console.info("testPicer24 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker25
       * @tc.name      : testPicker25
       * @tc.desc      : Testing createAssetWithShortTermPermission
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker25', 0, async (done: Function) => {
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig).then((result) => {
          console.info("createAssetWithShortTermPermission, result=" + JSON.stringify(result));
          if (result) {
            expect(true).assertTrue();
          } else {
            console.error("testPicker25 empty result");
            expect(false).assertTrue();
          }
        })
      } catch(error) {
        console.error("testPicker25 error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info("testPicer25 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker26
       * @tc.name      : testPicker26
       * @tc.desc      : Testing PhotoPickerComponent grid margin and browser margin
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker26', 0, async (done: Function) => {
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      // 支持传入宫格和大图Margin
      pickerOptions.gridMargin = {top: 10};
      pickerOptions.photoBrowserMargin = {top: 20};
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker24 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicker24 finish");
      done();
    });

    /* * 
       * @tc.number    : testPicker27
       * @tc.name      : testPicker27
       * @tc.desc      : Testing video play state changed callback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
      it('testPicker27', 0, async (done: Function) => {
      let code: number = EventType.VIDEO_PLAY_STATE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: number = event?.data?.msg;
        console.info('testPicker27 state =:' + JSON.stringify(result));
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker27 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicker27 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker28
     * @tc.name      : testPicker28
     * @tc.desc      : Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPicker28', 0, async (done: Function) => {
      let context = getContext();
      let originalUris = [' '];
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(context.filesDir + "/test.jpg").toString();
        photoAccessHelper.getPhotoAccessHelper(context).showAssetsCreationDialog([boxPath],
          [photoCreationConfig]).then((result) => {
          originalUris = result;
        });
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (a) => {
          if (!a) {
            console.log("testPicker28 replacePhotoPickerPreview fail");
            expect(false).assertTrue();
          } else {
            console.log("testPicker28 replacePhotoPickerPreview success");
            pickerController.saveTrustedPhotoAssets([boxPath], (err, arr) => {
              if (!err) {
                console.log("testPicker28 saveTrustedPhotoAssets fail");
                expect(false).assertTrue();
              } else {
                console.log("testPicker28 saveTrustedPhotoAssets success, save uris:" + arr);
                expect(true).assertTrue();
              }
            }, undefined, SaveMode.SAVE_AS);
          }
        });
      } catch (error) {
        console.log("testPicker28 error:" + JSON.stringify(error));
        expect(false).assertTrue();
      }
      await CommonFunc.sleep(1000);
      console.log("testPicker28 btn click finish");
      done();
    });

    /**
     * @tc.number    : testPicker29
     * @tc.name      : testPicker29
     * @tc.desc      : Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPicker29', 0, async (done: Function) => {
      let context = getContext();
      let originalUris = [' '];
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(context.filesDir + "/test.jpg").toString();
        photoAccessHelper.getPhotoAccessHelper(context).showAssetsCreationDialog([boxPath],
          [photoCreationConfig]).then((result) => {
          originalUris = result;
        });
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (a) => {
          if (!a) {
            console.log("testPicker29 replacePhotoPickerPreview fail");
            expect(false).assertTrue();
          } else {
            console.log("testPicker29 replacePhotoPickerPreview success");
            pickerController.saveTrustedPhotoAssets([boxPath], (err, arr) => {
              if (!err) {
                console.log("testPicker29 saveTrustedPhotoAssets fail");
                expect(false).assertTrue();
              } else {
                console.log("testPicker29 saveTrustedPhotoAssets success, save uris:" + arr);
                expect(true).assertTrue();
              }
            }, undefined, SaveMode.OVERWRITE);
          }
        });
      } catch (error) {
        console.log("testPicker29 error:" + JSON.stringify(error));
        expect(false).assertTrue();
      }
      await CommonFunc.sleep(1000);
      console.log("testPicker29 btn click finish");
      done();
    });
  })
}
