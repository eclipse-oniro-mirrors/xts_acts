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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
  ItemDisplayRatio
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo,
  AlbumPickerController } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { PhotoPickerResult } from '../MainAbility/common/PhotoPickerResult'
import {
  RecentPhotoOptions,
  PhotoSource,RecentPhotoInfo
} from '@ohos.file.RecentPhotoComponent';
import { fileUri } from '@kit.CoreFileKit';
import { deviceInfo } from '@kit.BasicServicesKit';

const SEEK_START = 3;
const SEEK_FINISH = 4;
const supportedDeviceForScreenShot = ['phone', 'tablet'];

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
  await CommonFunc.sleep(1000);
}

async function clickAlbumButton(driver: Driver) {
  console.info("testpicker create");
  let btn = await driver.findComponent(ON.id('albumButton'));
  if (btn === null) {
    console.info("clickAlbumButton findComponent btn fail");
    expect(false).assertTrue();
  } else {
    console.info("clickAlbumButton findComponent btn success");
    await btn.click();
  }
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
    const isExecutePicker = canIUse('SystemCapability.FileManagement.PhotoAccessHelper.Core');
    let driver: Driver;
    driver = Driver.create();

    beforeAll(async (done: Function) => {
      let maxButton = await driver.findComponent(ON.id("EnhanceMaximizeBtn"));
      let isExecuteTestCase: boolean = false;
      await CommonFunc.sleep(1000);
      if(maxButton !== null){
        await maxButton.click();
        isExecuteTestCase = true;
      }
      await CommonFunc.sleep(1000);
      if (!isExecuteTestCase) {
        try {
          let deviceTypeInfo: string = deviceInfo.deviceType;
          console.log(`deviceTypeInfo = ${deviceTypeInfo}`);
          if(supportedDeviceForScreenShot.indexOf(deviceTypeInfo) !==-1){
            driver.triggerCombineKeys(17, 18);
          }
        } catch (error) {
          console.error(`cannot screenshot, error is: ${JSON.stringify(error)}`);
        }
      }
      done();
    });
    
    beforeEach(async (done: Function) => {
      console.info("testPicker beforeEach start");
      await CommonFunc.sleep(5000);
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });


    /**
     * @tc.number    : testPicker01
     * @tc.name      : testPicker01
     * @tc.desc      : Testing route to PhotoPickerComponent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker01', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker01 finish");
      done();
    });

    /**
     * @tc.number    : testPicker02
     * @tc.name      : testPicker02
     * @tc.desc      : Testing Change PhotoPickerComponent BackgroundColor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker02', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker02 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicker02 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker03
     * @tc.name      : testPicker03
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's isRepeatSelectSupported property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker03', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker03 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker04
     * @tc.name      : testPicker04
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's checkboxTextColor property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker04', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker04 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker05
     * @tc.name      : testPicker05
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker05', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker05 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker06
     * @tc.name      : testPicker06
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker06', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker06 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker07
     * @tc.name      : testPicker07
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker07', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker07 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker08
     * @tc.name      : testPicker08
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker08', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker08 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker09
     * @tc.name      : testPicker09
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's selectMode property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker09', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.selectMode = SelectMode.SINGLE_SELECT;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: number = pickerOptions.selectMode ?? SelectMode.MULTI_SELECT;
        let result: PhotoPickerResult = event?.data?.msg.selectMode;
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
      console.info("testPicker09 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker10
     * @tc.name      : testPicker10
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxPhotoSelectNumber property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker10', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker10 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker11
     * @tc.name      : testPicker11
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxVideoSelectNumber property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker11', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker11 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker12
     * @tc.name      : testPicker12
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's maxSelectNumber property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker12', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker12 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker13
     * @tc.name      : testPicker13
     * @tc.desc      : Testing Change PhotoPickerComponent pickerOptions's orientation property
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker13', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker13 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker14
     * @tc.name      : testPicker14
     * @tc.desc      : Testing ItemInfo's all properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker14', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker14 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker15
     * @tc.name      : testPicker15
     * @tc.desc      : Testing MaxSelected
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker15', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      if (changeNumButton === null) {
        console.info("testPicker15 findComponent changeNumButton fail");
        expect(false).assertTrue();
      } else {
        console.info("testPicker15 findComponent changeNumButton success");
        await changeNumButton.click();
      }
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
      console.info("testPicker15 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker16
     * @tc.name      : testPicker16
     * @tc.desc      : Testing Album
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker16', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker16 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicker16 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker17
     * @tc.name      : testPicker17
     * @tc.desc      : Testing PhotoBrowerInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker17', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker17 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker18
     * @tc.name      : testPicker18
     * @tc.desc      : Testing PhotoBrowerInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker18', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker18 finish");
      events_emitter.off(event.eventId);
      done();
    });


    /**
     * @tc.number    : testPicker19
     * @tc.name      : testPicker19
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.ALL)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker19', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker19 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
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
      console.info("testPicker19 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker20
     * @tc.name      : testPicker20
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.CAMERA)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker20', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.CAMERA;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker20 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
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
      console.info("testPicker20 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker21
     * @tc.name      : testPicker21
     * @tc.desc      : Testing RecentPhotoComponent(PhotoSource.SCREENSHOT)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker21', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.SCREENSHOT;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker21 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
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
      console.info("testPicker21 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker22
     * @tc.name      : testPicker22
     * @tc.desc      : Testing PhotoPickerComponent set browser back button and checkbox
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker22', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker22 finish");
      done();
    });

    /**
     * @tc.number    : testPicker23
     * @tc.name      : testPicker23
     * @tc.desc      : Testing requestPhotoUrisReadPermission
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker23', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker23 finish");
      done();
    });

    /**
     * @tc.number    : testPicker24
     * @tc.name      : testPicker24
     * @tc.desc      : Testing CompleteButtonText
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker24', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
      }
      
      for (let index = 0; index < 3; index++) {
        await testCompleteButton(driver, options, index);
      }

      console.info("testPicker24 finish");
      done();
    });

    /**
     * @tc.number    : testPicker25
     * @tc.name      : testPicker25
     * @tc.desc      : Testing createAssetWithShortTermPermission
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker25', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker25 finish");
      done();
    });

    /**
     * @tc.number    : testPicker26
     * @tc.name      : testPicker26
     * @tc.desc      : Testing PhotoPickerComponent grid margin and browser margin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker26', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
      console.info("testPicker26 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicker26 finish");
      done();
    });

    /** 
     * @tc.number    : testPicker27
     * @tc.name      : testPicker27
     * @tc.desc      : Testing video play state changed callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker27', Level.LEVEL0, async (done: Function) => {
        if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.VIDEO_PLAY_STATE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: number = event?.data?.msg;
        console.info('testPicker27 state =:' + JSON.stringify(result));
        let vedioCallBackState: number = event?.data?.vedioCallBackState;
        if (vedioCallBackState === SEEK_START) {
            expect(true).assertTrue();
            console.log('state is SEEK_START:' + vedioCallBackState);
        } else if (vedioCallBackState === SEEK_FINISH) {
            expect(true).assertTrue();
            console.log('state is SEEK_FINISH:' + vedioCallBackState);
        } else {
            expect(true).assertFalse();
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
     * @tc.level     : Level 0
     */
    it('testPicker28', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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
     * @tc.level     : Level 0
     */
    it('testPicker29', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
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

    /**
    * @tc.number    : testPicker30
    * @tc.name      : testPicker30
    * @tc.desc      : Testing createAssetWithShortTermPermission
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testPicker30', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try {
        let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: '',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
        phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
        expect(false).assertTrue();
      } catch(error) {
        console.error("testPicker30 error: " + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(401);
      }
      console.info("testPicker30 finish");
      done();
    });

    /**
    * @tc.number    : testPicker31
    * @tc.name      : testPicker31
    * @tc.desc      : Testing singleSelectionModeWithHybridMode
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('testPicker31', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectNumber = 1;
      pickerOptions.singleSelectionMode = photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE;

      let photoPicker = new photoAccessHelper.PhotoViewPicker();
      try {
        photoPicker.select(pickerOptions).then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker31 PhotoViewPicker.select success, PhotoPickerResult uri: ' +
                JSON.stringify(photoSelectResult));
          expect(true).assertTrue();
        });
      } catch(error) {
        console.error("testPicker31 error: " + JSON.stringify(error) + error.code);
        expect(false).assertTrue();
      }
      console.info("testPicker31 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker32
       * @tc.name      : testPicker32
       * @tc.desc      : Testing mimeTypeFilter fileSizeFilter videoDurationFilter
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker32',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png', 'image/jpeg', 'video/*']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.MORE_THAN,
        fileSize: 1
      }
      pickerOptions.videoDurationFilter = {
        filterOperator: photoAccessHelper.FilterOperator.BETWEEN,
        videoDuration: 1,
        extraVideoDuration: 10000
      }
      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker32, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker32, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker32 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker33
       * @tc.name      : testPicker33
       * @tc.desc      : Testing FilterOperator.BETWEEN
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker33',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.BETWEEN,
        fileSize: 1,
        extraFileSize:1000000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker33, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker33, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker33 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker34
       * @tc.name      : testPicker34
       * @tc.desc      : Testing FilterOperator.LESS_THAN
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker34',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.LESS_THAN,
        fileSize: 100000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker34, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker34, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker34 finish");
      done();
    });
    /* *
       * @tc.number    : testPicker35
       * @tc.name      : testPicker35
       * @tc.desc      : Testing FilterOperator.EQUAL_TO
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker35',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.EQUAL_TO,
        fileSize: 10000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker35, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker35, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker35 finish");
      done();
    });
    /* *
       * @tc.number    : testPicker36
       * @tc.name      : testPicker36
       * @tc.desc      : Testing FilterOperator.NOT_EQUAL_TO
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker36',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.NOT_EQUAL_TO,
        fileSize: 10000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker36, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker36, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker36 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker37
       * @tc.name      : testPicker37
       * @tc.desc      : Testing FilterOperator.MORE_THAN_OR_EQUAL_TO
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker37',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.MORE_THAN_OR_EQUAL_TO,
        fileSize: 1000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker37, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker37, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker37 finish");
      done();
    });

    /* *
       * @tc.number    : testPicker38
       * @tc.name      : testPicker38
       * @tc.desc      : Testing FilterOperator.LESS_THAN_OR_EQUAL_TO
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
       */
    it('testPicker38',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.mimeTypeFilter = {
        mimeTypeArray: ['image/png']
      }
      pickerOptions.fileSizeFilter = {
        filterOperator: photoAccessHelper.FilterOperator.LESS_THAN_OR_EQUAL_TO,
        fileSize: 100000
      }

      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker38, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          expect(true).assertTrue();
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker38, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker38 finish");
      done();
    });

    /* *
     * @tc.number    : testPicker39
     * @tc.name      : testPicker39
     * @tc.desc      : Testing PhotoPickerComponent singleLineConfig
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
    */
    it('testPicker39', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.singleLineConfig = {
        itemDisplayRatio: ItemDisplayRatio.SQUARE_RATIO,
        itemBorderRadius: {
          topLeft: 8,
          bottomRight: 8
        },
        itemGap: '10vp'
      };
      pickerOptions.singleLineConfig.itemDisplayRatio = ItemDisplayRatio.ORIGINAL_SIZE_RATIO;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker39 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicker39 finish");
      done();
    });

    /**
     * @tc.number    : testPicker40
     * @tc.name      : testPicker40
     * @tc.desc      : Testing getPhotoPickerComponentDefaultAlbumName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker40', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }

      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try {
        phAccessHelper.getPhotoPickerComponentDefaultAlbumName().then((defaultAlbumName: string) => {
          console.info("testPicer40 getPhotoPickerComponentDefaultAlbumName, defaultAlbumName = " + defaultAlbumName);
          let hasDefaultAlbumName: boolean = defaultAlbumName !== undefined && defaultAlbumName !== '';
          expect(hasDefaultAlbumName).assertTrue();
        })
      } catch(error) {
        console.error("testPicer40 error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info("testPicker40 finish");
      done();
    });

    /**
     * @tc.number    : testPicker41
     * @tc.name      : testPicker41
     * @tc.desc      : Testing PhotoPickerComponent uiComponentColorMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker41', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.uiComponentColorMode = PickerColorMode.AUTO;
      pickerOptions.isPhotoTakingSupported = true;
      pickerOptions.isSearchSupported = true;
      pickerOptions.recommendationOptions = { textContextInfo: { text: '今年'}};
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker41 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker41 finish");
      done();
    });

    /**
     * @tc.number    : testPicker42
     * @tc.name      : testPicker42
     * @tc.desc      : Testing PhotoPickerComponent uiComponentColorMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker42', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.uiComponentColorMode = PickerColorMode.LIGHT;
      pickerOptions.backgroundColor = '#f9f9f9';
      pickerOptions.isPhotoTakingSupported = true;
      pickerOptions.isSearchSupported = true;
      pickerOptions.recommendationOptions = { textContextInfo: { text: '今年'}};
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker42 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker42 finish");
      done();
    });

    /**
     * @tc.number    : testPicker43
     * @tc.name      : testPicker43
     * @tc.desc      : Testing PhotoPickerComponent uiComponentColorMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker43', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.uiComponentColorMode = PickerColorMode.DARK;
      pickerOptions.backgroundColor = '#212121';
      pickerOptions.isPhotoTakingSupported = true;
      pickerOptions.isSearchSupported = true;
      pickerOptions.recommendationOptions = { textContextInfo: { text: '今年'}};
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker43 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker43 finish");
      done();
    });

    /**
     * @tc.number    : testPicker44
     * @tc.name      : testPicker44
     * @tc.desc      : Testing RecentPhotoComponent(isAutoRefreshSupported)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker44', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.RECENT_PHOTO_INFO;
      let recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
      recentPhotoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      recentPhotoOptions.period = 0;
      recentPhotoOptions.photoSource = PhotoSource.ALL;
      recentPhotoOptions.isAutoRefreshSupported = true;
      recentPhotoOptions.colorMode=PickerColorMode.LIGHT;
      let callback = (event: events_emitter.EventData) => {
        let baseItemInfo: BaseItemInfo = event?.data?.msg;
        console.info('testPicker44 baseItemInfo =:' + JSON.stringify(baseItemInfo));
        expect(baseItemInfo.uri).not().assertUndefined();
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
      console.info('testPicker44 create');
      let component: Component = await driver.findComponent(ON.id('recentPhoto'));
      if (component === null) {
        console.info('testPicker44 no recentPhoto');
      } else {
        await component.click();
        await CommonFunc.sleep(2000);
      }
      router.back();
      console.info("testPicker44 finish");
      done();
    });

    /**
     * @tc.number    : testPicker45
     * @tc.name      : testPicker45
     * @tc.desc      : Testing PhotoPickerComponent gridOffset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker45', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.gridStartOffset = 10;
      pickerOptions.gridEndOffset = 10;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker45 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).not().assertUndefined();
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      router.back();
      console.info("testPicker45 finish");
      done();
    });

    /**
     * @tc.number    : testPicker46
     * @tc.name      : testPicker46
     * @tc.desc      : Testing getRecentPhotoInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker46', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let options: RecentPhotoOptions = new RecentPhotoOptions();
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      options.period = 0;
      options.photoSource = PhotoSource.ALL;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try{
        phAccessHelper.getRecentPhotoInfo(options).then((result : RecentPhotoInfo) => {
          console.info('testPicker40, photoAccessHelper.getRecentPhotoInfo successfully, PhotoSelectResult uri: ' +
          JSON.stringify(result));
          expect(true).assertTrue();
        })
      } catch(err) {
        console.error(`testPicker40, photoAccessHelper.getRecentPhotoInfo failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      }
      console.info("testPicker40 finish");
      done();
    });

    /**
     * @tc.number    : testPicker47
     * @tc.name      : testPicker47
     * @tc.desc      : Testing setFontSize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker47', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.ALBUM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
      albumOptions.fontSize = 50;
      let callback = (event: events_emitter.EventData) => {
        let result: ItemInfo = event?.data?.msg;
        console.info('testPicker47 select ItemInfo=:' + JSON.stringify(result));
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
          albumOptions: albumOptions,
        }
      }
      await routeToUrl(options);

      console.info('testPicker47 create');
      await clickAlbumButton(driver);

      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker47 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicker47 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.number    : testPicker48
     * @tc.name      : testPicker48
     * @tc.desc      : Testing PhotoPicker combinedMediaTypeFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker48', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.combinedMediaTypeFilter = ['image|(movingPhoto)|(image/gif)', 'video|*|video/mp4'];
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker48 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker48 finish");
      done();
    });

    /**
     * @tc.number    : testPicker49
     * @tc.name      : testPicker49
     * @tc.desc      : Testing PhotoPicker combinedMediaTypeFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPicker49', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let fileSizeFilterArray: Array<photoAccessHelper.PhotoViewMimeTypeFileSizeFilter> = [];
      let filter: photoAccessHelper.PhotoViewMimeTypeFileSizeFilter = {
        photoViewMimeType: photoAccessHelper.PhotoViewMIMETypes.MOVING_PHOTO_IMAGE_TYPE,
        sizeFilter: {
          filterOperator: photoAccessHelper.FilterOperator.LESS_THAN,
          fileSize: 8048576,
        }
      }
      fileSizeFilterArray.push(filter);
      pickerOptions.photoViewMimeTypeFileSizeFilters = fileSizeFilterArray;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker49 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker49 finish");
      done();
    });
  })
}
