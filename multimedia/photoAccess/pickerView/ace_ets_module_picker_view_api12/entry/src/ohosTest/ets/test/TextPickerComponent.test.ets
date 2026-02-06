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
import { fileIo } from '@kit.CoreFileKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { ClickInfo } from '../MainAbility/common/Common';
import { EventType } from '../MainAbility/common/Common';
import { Component, Driver, ON, MatchPattern } from '@ohos.UiTest';
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
  ItemDisplayRatio,
  BadgeConfig,
  BadgeType,
  PreselectedInfo,
  VideoPlayerState,
  ClickResult
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
import { BusinessError } from '@kit.BasicServicesKit';

const SEEK_START = 3;
const SEEK_FINISH = 4;
const SELECTED_STATUS = 0;

async function driveFn() {
  let dr = Driver.create();
  await CommonFunc.sleep(100);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 3000);
  await power?.click();
  await CommonFunc.sleep(1000);
}

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


function getSheetPickerOptions(): photoAccessHelper.PhotoSelectOptions {
  let sheetPickerOptions = new photoAccessHelper.PhotoSelectOptions();
  sheetPickerOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
  sheetPickerOptions.isPhotoTakingSupported = false;
  sheetPickerOptions.maxSelectNumber = 10;
  sheetPickerOptions.isDestroyedWithNavigation = true;
  return sheetPickerOptions;
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
  pickerOptions.edgeEffect = EdgeEffect.Spring;
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

async function clickUpdatablePickerButton(driver: Driver) {
  console.info("testPicker create");
  let btn = await driver.findComponent(ON.id('updatePickerOptions'));
  console.info("testPicker findComponent updatePickerOptions succsess");
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

function waitForSelectItemInfo(code: number, timeout = 5000): Promise<ItemInfo> {
  return new Promise((resolve, reject) => {
    const evt: events_emitter.InnerEvent = { eventId: code, priority: events_emitter.EventPriority.LOW };
    const t = setTimeout(() => { events_emitter.off(code); reject(new Error('timeout')); }, timeout);
    events_emitter.on(evt, (ev) => {
      clearTimeout(t);
      events_emitter.off(code);
      resolve(ev?.data?.msg);
    });
  });
}

async function clickExitBrowserButton(driver: Driver) {
  const exitButton: Component | null = await driver.findComponent(ON.id('exitBrowser'));
  await exitButton!.click();
  console.info('testPicker55: clicked exitBrowser, browser closed');
  await CommonFunc.sleep(800);
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
  } else {
    console.error("can not find button");
    expect(false).assertTrue();
  }
  await CommonFunc.sleep(1000);
  router.back();
}

async function saveMovingPhoto() {
  let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
    fileNameExtension: 'jpg',
    photoType: photoAccessHelper.PhotoType.IMAGE,
    subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO,
  };
  const context = getContext();
  let resultUri = '';
  const fileToSavePath = context.filesDir + '/01.jpg';
  const fileToSaveUri = fileUri.getUriFromPath(fileToSavePath).toString();
  console.log('saveMovingPhoto fileToSaveUri', fileToSaveUri, 'fileToSavePath', fileToSavePath);
  photoAccessHelper
    .getPhotoAccessHelper(context)
    .showAssetsCreationDialog([fileToSaveUri], [photoCreationConfig])
    .then(uri => {
      console.log(`saveMovingPhoto result = ${JSON.stringify(uri)}`);
      resultUri = uri[0];
    })
  await driveFn();
  if (!resultUri.startsWith('file')) {
    throw new Error(resultUri);
  }
  let resultFile: fileIo.File = fileIo.openSync(resultUri, fileIo.OpenMode.READ_WRITE);
  console.log('saveMovingPhoto fileToSaveUri', fileToSaveUri)
  let srcFile: fileIo.File = fileIo.openSync(fileToSavePath, fileIo.OpenMode.READ_ONLY);
  console.log('saveMovingPhoto srcFile')
  let bufSize: number = 200000;
  let readSize: number = 0;
  let buf = new ArrayBuffer(bufSize);
  let readLen = fileIo.readSync(srcFile.fd, buf, {
    offset: readSize,
    length: bufSize
  });
  console.log('saveMovingPhoto readLen', readLen)
  if (readLen > 0) {
    readSize += readLen;
    fileIo.writeSync(resultFile.fd, buf, { length: readLen });
  }
  fileIo.closeSync(srcFile);
  fileIo.closeSync(resultFile);
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
          driver.triggerCombineKeys(17, 18);
        } catch (error) {
          console.error(`cannot screenshot, error is: ${JSON.stringify(error)}`);
        }
      }
      done();
    });
    
    beforeEach(async (done: Function) => {
      console.info("testPicker beforeEach start");
      events_emitter.off(EventType.PHOTO_PICKER_INFO)
      await CommonFunc.sleep(1000);
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });


    /**
     * @tc.name   testPicker01
     * @tc.number testPicker01
     * @tc.desc   Testing route to PhotoPickerComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker02
     * @tc.number testPicker02
     * @tc.desc   Testing Change PhotoPickerComponent BackgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker03
     * @tc.number testPicker03
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's isRepeatSelectSupported property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker04
     * @tc.number testPicker04
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's checkboxTextColor property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker05
     * @tc.number testPicker05
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker06
     * @tc.number testPicker06
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's photoBrowserBackgroundColorMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker07
     * @tc.number testPicker07
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker08
     * @tc.number testPicker08
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's maxSelectedReminderMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker09
     * @tc.number testPicker09
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's selectMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker10
     * @tc.number testPicker10
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's maxPhotoSelectNumber property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker11
     * @tc.number testPicker11
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's maxVideoSelectNumber property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker12
     * @tc.number testPicker12
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's maxSelectNumber property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker13
     * @tc.number testPicker13
     * @tc.desc   Testing Change PhotoPickerComponent pickerOptions's orientation property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker14
     * @tc.number testPicker14
     * @tc.desc   Testing ItemInfo's all properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        expect(result.photoSubType).not().assertUndefined();
        expect(result.dynamicRangeType).not().assertUndefined();
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
     * @tc.name   testPicker15
     * @tc.number testPicker15
     * @tc.desc   Testing MaxSelected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker16
     * @tc.number testPicker16
     * @tc.desc   Testing Album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker17
     * @tc.number testPicker17
     * @tc.desc   Testing PhotoBrowerInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker18
     * @tc.number testPicker18
     * @tc.desc   Testing PhotoBrowerInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
          expect(SELECTED_STATUS).assertEqual(ClickType.SELECTED);
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

      console.info('testPicker18 create');
      let btn: Component = await driver.findComponent(ON.type('GridItem'));
      if(btn === null) {
        console.info('testPicker18 no GridItem');
      } else {
        if(clicked) {
          await btn.click();
          await CommonFunc.sleep(1000);
          clicked = !clicked;
          await CommonFunc.sleep(1000);
          await btn.click();
          await CommonFunc.sleep(1000);
        }
      }

      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker18 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      router.back();
      console.info("testPicker18 finish");
      events_emitter.off(event.eventId);
      done();
    });


    /**
     * @tc.name   testPicker19
     * @tc.number testPicker19
     * @tc.desc   Testing RecentPhotoComponent(PhotoSource.ALL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker20
     * @tc.number testPicker20
     * @tc.desc   Testing RecentPhotoComponent(PhotoSource.CAMERA)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker21
     * @tc.number testPicker21
     * @tc.desc   Testing RecentPhotoComponent(PhotoSource.SCREENSHOT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker22
     * @tc.number testPicker22
     * @tc.desc   Testing PhotoPickerComponent set browser back button and checkbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker23
     * @tc.number testPicker23
     * @tc.desc   Testing requestPhotoUrisReadPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
            console.info('success');
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
     * @tc.name   testPicker24
     * @tc.number testPicker24
     * @tc.desc   Testing CompleteButtonText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker25
     * @tc.number testPicker25
     * @tc.desc   Testing createAssetWithShortTermPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
            console.info('success');
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
     * @tc.name   testPicker26
     * @tc.number testPicker26
     * @tc.desc   Testing PhotoPickerComponent grid margin and browser margin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker27
     * @tc.number testPicker27
     * @tc.desc   Testing video play state changed callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker27', Level.LEVEL0, async (done: Function) => {
        if (!isExecutePicker) {
        done();
        return;
      }

      expect(VideoPlayerState.PLAYING == 0).assertTrue();
      expect(VideoPlayerState.PAUSED == 1).assertTrue();
      expect(VideoPlayerState.STOPPED == 2).assertTrue();
      expect(VideoPlayerState.SEEK_START == 3).assertTrue();
      expect(VideoPlayerState.SEEK_FINISH == 4).assertTrue();

      let code: number = EventType.VIDEO_PLAY_STATE;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: number = event?.data?.msg;
        console.info('testPicker27 state =:' + JSON.stringify(result));
        let vedioCallBackState: number = event?.data?.vedioCallBackState;
        if (vedioCallBackState === SEEK_START) {
            console.log('state is SEEK_START:' + vedioCallBackState);
        } else if (vedioCallBackState === SEEK_FINISH) {
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
     * @tc.name   testPicker28
     * @tc.number testPicker28
     * @tc.desc   Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker29
     * @tc.number testPicker29
     * @tc.desc   Testing PhotoPickerComponent replacePhotoPickerPreview and saveTrustedPhotoAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker30
     * @tc.number testPicker30
     * @tc.desc   Testing createAssetWithShortTermPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker31
     * @tc.number testPicker31
     * @tc.desc   Testing singleSelectionModeWithHybridMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        });
      } catch(error) {
        console.error("testPicker31 error: " + JSON.stringify(error) + error.code);
        expect(false).assertTrue();
      }
      console.info("testPicker31 finish");
      done();
    });

    /**
     * @tc.name   testPicker32
     * @tc.number testPicker32
     * @tc.desc   Testing mimeTypeFilter fileSizeFilter videoDurationFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker32, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker32 finish");
      done();
    });

    /**
     * @tc.name   testPicker33
     * @tc.number testPicker33
     * @tc.desc   Testing FilterOperator.BETWEEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker33, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker33 finish");
      done();
    });

    /**
     * @tc.name   testPicker34
     * @tc.number testPicker34
     * @tc.desc   Testing FilterOperator.LESS_THAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker34, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker34 finish");
      done();
    });
    /**
     * @tc.name   testPicker35
     * @tc.number testPicker35
     * @tc.desc   Testing FilterOperator.EQUAL_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker35, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker35 finish");
      done();
    });
    /**
     * @tc.name   testPicker36
     * @tc.number testPicker36
     * @tc.desc   Testing FilterOperator.NOT_EQUAL_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker36, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker36 finish");
      done();
    });

    /**
     * @tc.name   testPicker37
     * @tc.number testPicker37
     * @tc.desc   Testing FilterOperator.MORE_THAN_OR_EQUAL_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker37, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker37 finish");
      done();
    });

    /**
     * @tc.name   testPicker38
     * @tc.number testPicker38
     * @tc.desc   Testing FilterOperator.LESS_THAN_OR_EQUAL_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker38, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker38 finish");
      done();
    });

    /**
     * @tc.name   testPicker39
     * @tc.number testPicker39
     * @tc.desc   Testing PhotoPickerComponent singleLineConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker40
     * @tc.number testPicker40
     * @tc.desc   Testing getPhotoPickerComponentDefaultAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker41
     * @tc.number testPicker41
     * @tc.desc   Testing PhotoPickerComponent uiComponentColorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker42
     * @tc.number testPicker42
     * @tc.desc   Testing PhotoPickerComponent uiComponentColorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker43
     * @tc.number testPicker43
     * @tc.desc   Testing PhotoPickerComponent uiComponentColorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker44
     * @tc.number testPicker44
     * @tc.desc   Testing RecentPhotoComponent(isAutoRefreshSupported)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker45
     * @tc.number testPicker45
     * @tc.desc   Testing PhotoPickerComponent gridOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker46
     * @tc.number testPicker46
     * @tc.desc   Testing getRecentPhotoInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        })
      } catch(err) {
        console.error(`testPicker40, photoAccessHelper.getRecentPhotoInfo failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      }
      console.info("testPicker40 finish");
      done();
    });

    /**
     * @tc.name   testPicker47
     * @tc.number testPicker47
     * @tc.desc   Testing setFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker48
     * @tc.number testPicker48
     * @tc.desc   Testing PhotoPicker combinedMediaTypeFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPicker49
     * @tc.number testPicker49
     * @tc.desc   Testing PhotoPicker combinedMediaTypeFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testPicker50
     * @tc.number testPicker50
     * @tc.desc   Testing PhotoPicker BadgeConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker50', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let str1: string = 'file://media/Photo/64/IMG_1/IMG_1.gif';
      let str2: string = 'file://media/Photo/64/IMG_2/IMG_2.gif';
      let str3: string = 'file://media/Photo/64/IMG_3/IMG_3.gif';
      const uris = Array(1000).fill(str1).map((item: string, index: number)=>{
        return item + index;
      })
      uris.push(str1);
      uris.push(str2);
      uris.push(str3);

      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let pickerController: PickerController = new PickerController();
      const badgeConfig = new BadgeConfig();
      badgeConfig.badgeType = BadgeType.BADGE_UPLOADED;
      badgeConfig.uris = uris;
      pickerOptions.badgeConfig = badgeConfig;
      await CommonFunc.sleep(1000);
      pickerController.setData(DataType.SET_BADGE_CONFIGS, uris);
      await CommonFunc.sleep(1000);
      pickerController.addData(DataType.SET_BADGE_CONFIGS, uris);
      await CommonFunc.sleep(1000);
      pickerController.deleteData(DataType.SET_BADGE_CONFIGS, uris);
      let code: number = EventType.PHOTO_PICKER_INFO;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      done();
    });

    /**
     * @tc.name   testPicker51
     * @tc.number testPicker51
     * @tc.desc   Testing ContextRecoveryInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker51', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let sheetPickerOptions: photoAccessHelper.PhotoSelectOptions = getSheetPickerOptions();
      let testFinished: boolean = true;
      let contextRecoveryInfo = {
        "albumUri" : "",
        "displayName": "IMG_20240522_085513_3.jpg",
        "recommendationType": 0,
        "selectedRecommendationType": 0,
        "time": 1756371999125,
        "version": 1.0,
        "gridLevel": 1
      } as photoAccessHelper.ContextRecoveryInfo;
      sheetPickerOptions.contextRecoveryInfo = contextRecoveryInfo;
      sheetPickerOptions.isMovingPhotoBadgeShown = true;
      let code = EventType.PHOTO_PICKER_INFO;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
        params: {
          eventId: code,
          pickerOptions: sheetPickerOptions,
        }
      }
      let callback = (data: events_emitter.EventData) => {
        let result: PhotoPickerResult = data?.data?.msg;
        console.log('testPicker51', JSON.stringify(result))
        expect(result.movingPhotoBadgeStates).not().assertUndefined();
        events_emitter.off(code, callback);
      }
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      };
      events_emitter.on(event, callback);

      await routeToUrl(options);
      await CommonFunc.sleep(1000);
      let chooostModeButton: Component = await driver.findComponent(ON.text('TEXT_DONE'));
      let button: Component = await driver.findComponent(ON.id('btnSelectPhoto'));
      if (button !== undefined  && chooostModeButton !== undefined) {
        await chooostModeButton.click();
        await button.click();
      } else {
        console.error("testPicker51 can not find button");
        expect(false).assertTrue();
      }

      const checkbox = await driver.waitForComponent(ON.type('Checkbox'), 3000);
      if (checkbox !== undefined && checkbox !== null) {
        await checkbox.click();
        await CommonFunc.sleep(1000);
        const finishBtn: Component = await driver.findComponent(ON.id('Complete'));
        await finishBtn.click();
        await CommonFunc.sleep(1000);
      }

      router.back();
      await CommonFunc.sleep(1000);
      events_emitter.off(code, callback);
      expect(testFinished).assertTrue();
      console.info("testPicker51 finish");
      done();
    });

    /**
     * @tc.name   testPicker52
     * @tc.number testPicker52
     * @tc.desc   Test pickerIndex and preselectedInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker52', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.pickerIndex = 1;
      pickerOptions.preselectedInfos = [
        {
          uri: 'file://media/Photo/test1.jpg',
          preselectablePickerIndex: 1,
        }
      ];
      let callback = (event: events_emitter.EventData) => {
        let pickerIndex: number = event?.data?.msg?.pickerIndex;
        let preselectedInfos: PreselectedInfo[] = event?.data?.msg?.preselectedInfos;
        expect(pickerIndex).assertEqual(1);
        expect(preselectedInfos.length).assertLarger(0);
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
      await CommonFunc.sleep(1000);
      await clickResultButton(driver);
      events_emitter.off(event.eventId);

      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker52 finish");
      done();
    });

    /**
     * @tc.name   testPicker53
     * @tc.number testPicker53
     * @tc.desc   Testing preselected infos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker53', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.pickerIndex = 2;
      pickerOptions.preselectedInfos = [
        {
          uri: 'file://media/Photo/test2.jpg',
          preselectablePickerIndex: 1,
        },
        {
          uri: 'file://media/Photo/test3.jpg',
          preselectablePickerIndex: -1,
        }
      ];
      let callback = (event: events_emitter.EventData) => {
        let result: PhotoPickerResult = event?.data?.msg;

        console.info('testTabSelection received result: ' + JSON.stringify(result));
        expect(result).not().assertUndefined();
        expect(result.pickerIndex).assertEqual(2);
        expect(result.preselectedInfos?.length).assertLarger(0);

        const clicked = result.preselectedInfos.find((item: PreselectedInfo) => item.preselectablePickerIndex === 2)
        expect(clicked).not().assertUndefined();
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

      let checkBoxes: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxes === null || checkBoxes.length <= 0) {
        console.info("testPicker53 findComponent checkbox fail");
        router.back();
        done();
        console.info("testPicker53 finish!");
        return;
      } else {
        console.info("testPicker53 findComponent checkbox success");
        await checkBoxes[0].click();
        await CommonFunc.sleep(2000);
        console.info("testPicker53 btn click finish");
      }

      await clickResultButton(driver);
      events_emitter.off(event.eventId);
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker53 finish");
      done();
    });

    /**
     * @tc.name   testPicker54
     * @tc.number testPicker54
     * @tc.desc   Testing setData(SET_SELECTED_INFO)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker54', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }

      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let pickerController: PickerController = new PickerController();
      const preselectedInfos: PreselectedInfo[] = [
        { uri: 'file://media/Photo/test2.jpg', preselectablePickerIndex: 2 },
        { uri: 'file://media/Photo/test3.jpg', preselectablePickerIndex: 2 }
      ];
      pickerOptions.pickerIndex = 2;
      pickerOptions.preselectedInfos = preselectedInfos;

      let callback = (event: events_emitter.EventData) => {
        let result: PhotoPickerResult = event?.data?.msg;
        console.info('testPicker54 received result: ' + JSON.stringify(result));
        expect(result.preselectedInfos?.length).assertEqual(2);
      };

      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      };
      events_emitter.on(event, callback);

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      };

      await routeToUrl(options);

      // Set DataType.SET_SELECTED_INFO
      pickerController.setData(DataType.SET_SELECTED_INFO, preselectedInfos);

      await clickResultButton(driver);
      events_emitter.off(event.eventId);

      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker54 finish");
      done();
    });

    /**
     * @tc.name   testPicker55
     * @tc.number testPicker55
     * @tc.desc   Testing PickerItem movingPhotoBadgeState == 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker55', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) { done(); return; }

      const code: number = EventType.SELECT_ITEM_INFO;

      const pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.MOVING_PHOTO_IMAGE_TYPE;
      pickerOptions.isMovingPhotoBadgeShown = true;
      pickerOptions.selectMode = SelectMode.MULTI_SELECT;
      pickerOptions.isSearchSupported = false;


      const options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: { eventId: code, pickerOptions }
      };
      await routeToUrl(options);

      try {
        await saveMovingPhoto();
      } catch (e) {
        console.error('saveMovingPhoto fail', e)
      }

      const strJson: string = getInspectorByKey('PhotoPickerComponent');

      expect(JSON.parse(strJson)?.$attrs?.visibility).assertEqual('Visibility.Visible');


      await CommonFunc.sleep(600);
      const images: Array<Component> = await driver.findComponents(ON.type('Image'));
      expect(images && images.length > 0).assertTrue();
      if(!images || images.length === 0) {
        console.log("Any image found! Fail!");
        router.back();
        console.info('testPicker55 finish!');
        done();
        return;
      }
      await images[0].click();
      console.info('testPicker55: browser mode opened!');
      await CommonFunc.sleep(500);


      let movingBtn: Component | null = await driver.findComponent(ON.id('PickerMovingPhotoToggle'));
      if (movingBtn === null) {
        console.log("Any button found! Fail!");
        await clickExitBrowserButton(driver);
      } else {
        await movingBtn!.click();
        await CommonFunc.sleep(3000);
        console.info('testPicker55: clicked "Moving picture" button');

        await clickExitBrowserButton(driver);

        const checkboxes: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
        expect(checkboxes && checkboxes.length > 0).assertTrue();
        const itemPromise = waitForSelectItemInfo(code, 5000);
        await checkboxes[0].click();
        console.info('testPicker55: Checkbox selected!');

        const selectedItem = await itemPromise;

        console.info('testPicker55: ItemInfo -> ' + JSON.stringify(selectedItem));
        console.info('testPicker55: movingPhotoBadgeState -> ' + JSON.stringify(selectedItem.movingPhotoBadgeState));
        expect(selectedItem.movingPhotoBadgeState).assertEqual(2);
      }

      expect(photoAccessHelper.MovingPhotoBadgeStateType.NOT_MOVING_PHOTO).assertEqual(0);
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_ENABLED).assertEqual(1);
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_DISABLED).assertEqual(2);

      router.back();
      console.info('testPicker55 finish');
      done();
    });

    /**
     * @tc.name   testPicker56
     * @tc.number testPicker56
     * @tc.desc   Testing UpdatablePickerConfigs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker56', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let expectedMaxSelectNumber: number = 10;
        let expectedMaxSelectPhotoNumber: number = 5;
        let expectedMaxSelectVideoNumber: number = 5;
        let expectedCheckBoxColor: String = '#ff38ff00';
        let expectedCheckBoxTextColor: String = '#ffffdc00';
        let expectedBackgroundColor: String = '#f00000';
        let expectedBrowserColorMode: PickerColorMode = PickerColorMode.DARK;
        let expectedUiComponentColorMode: PickerColorMode = PickerColorMode.DARK;
        let expectedIsSlidingSupported: boolean = true;
        let expectedEdgeEffect: EdgeEffect = EdgeEffect.None;
        let expectedMimeType: photoAccessHelper.PhotoViewMIMETypes = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
        let expectedMimeTypeFilter: photoAccessHelper.MimeTypeFilter = { mimeTypeArray: ['*/*'] }
        let expectedRepeatSelectSupported: boolean = true;
        let expectedSelectMode: number = 0;
        let expectedSingleSelectionMode: number = 2;
        let expectedPreselectedUris: Array<string> = ['file:img//sample'];
        let expectedAutoPlayScenes: Array<photoAccessHelper.AutoPlayScene> = [
          {
            sceneType: photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER,
            playMode: photoAccessHelper.PlayMode.AUTO_PLAY,
          },
          {
            sceneType: photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE,
            playMode: photoAccessHelper.PlayMode.AUTO_PLAY,
          }
        ];
        let expectedAppAlbumFilters: Array<string> = 
          ['com.example.sourceapp.album', 'com.example.sourceapp.album1', 'com.example.sourceapp.album2',];  

        let msg: PhotoPickerResult = event?.data?.msg;
        console.info('testPicker56 result msg ' + JSON.stringify(msg));
        expect(photoAccessHelper.PlayMode.DEFAULT).assertEqual(0);
        expect(expectedMaxSelectNumber).assertEqual(msg.maxSelectCount);
        expect(expectedMaxSelectPhotoNumber).assertEqual(msg.maxPhotoSelectNumber);
        expect(expectedMaxSelectVideoNumber).assertEqual(msg.maxVideoSelectNumber);
        expect(expectedCheckBoxColor).assertEqual(msg.checkBoxColor);
        expect(expectedCheckBoxTextColor).assertEqual(msg.checkboxTextColor);
        expect(expectedBackgroundColor).assertEqual(msg.backgroundColor);
        expect(expectedBrowserColorMode).assertEqual(msg.photoBrowserBackgroundColorMode);
        expect(expectedUiComponentColorMode).assertEqual(msg.uiComponentColorMode);
        expect(expectedIsSlidingSupported).assertEqual(msg.isSlidingSupported);
        expect(expectedEdgeEffect).assertEqual(msg.edgeEffect);
        expect(expectedMimeType).assertEqual(msg.mimeType);
        expect(expectedMimeTypeFilter).assertDeepEquals(msg.mimeTypeFilter);
        expect(expectedRepeatSelectSupported).assertEqual(msg.isRepeatSelectSupported);
        expect(expectedSelectMode).assertEqual(msg.selectMode);
        expect(expectedSingleSelectionMode).assertEqual(msg.singleSelectionMode);
        expect(expectedPreselectedUris).assertDeepEquals(msg.preselectedUris);
        expect(expectedAutoPlayScenes).assertDeepEquals(msg.autoPlayScenes);
        expect(expectedAppAlbumFilters).assertDeepEquals(msg.appAlbumFilters);
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
      console.info("testPicker56 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickUpdatablePickerButton(driver);
      router.back();
      events_emitter.off(event.eventId);
      console.info("testPicker56 finish");
      done();
    });

     /**
      * @tc.number      testPicker57
      * @tc.name        testPicker57
      * @tc.desc        Testing Change PhotoPickerComponent pickerOptions's isSlidingSupported property
      * @tc.size        MediumTest
      * @tc.type        Function
      * @tc.level       Level 0
      */
    it('testPicker57', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.isSlidingSupported = true;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: boolean = pickerOptions.isSlidingSupported ?? false;
        let result: PhotoPickerResult = event?.data?.msg.isSlidingSupported;
        console.info('testPicker57 result event.data.msg=:' + result);
        console.info('testPicker57 result expect =:' + expectResult);
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
      console.info("testPicker57 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicker57 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
      * @tc.number      testPicker58
      * @tc.name        testPicker58
      * @tc.desc        Testing PhotoPicker assetFilter
      * @tc.size        MediumTest
      * @tc.type        Function
      * @tc.level       Level 0
      */
    it('testPicker58', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      const operationItems: photoAccessHelper.OperationItem[] = [
        {
          operationType: photoAccessHelper.OperationType.BEGIN_WRAP,
          field: undefined,
          value: undefined
        },
        {
          operationType: photoAccessHelper.OperationType.EQUAL_TO,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [1]
        },
        {
          operationType: photoAccessHelper.OperationType.AND,
          field: undefined,
          value: undefined
        },
        {
          operationType: photoAccessHelper.OperationType.EQUAL_TO,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.OR,
          field: undefined,
          value: undefined
        },
        {
          operationType: photoAccessHelper.OperationType.GREATER_THAN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.LESS_THAN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.GREATER_THAN_OR_EQUAL_TO,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.LESS_THAN_OR_EQUAL_TO,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.IN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.NOT_IN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.BETWEEN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.NOT_BETWEEN,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
        {
          operationType: photoAccessHelper.OperationType.END_WRAP,
          field: photoAccessHelper.PhotoKeys.PHOTO_TYPE,
          value: [0]
        },
      ]
      pickerOptions.assetFilter = operationItems;
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker58 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker58 finish");
      done();
    });

    /**
      * @tc.number      testPicker59
      * @tc.name        testPicker59
      * @tc.desc        Testing ItemInfo's videoMode
      * @tc.size        MediumTest
      * @tc.type        Function
      * @tc.level       Level 0
      */
    it('testPicker59', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'png',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      let boxPath = fileUri.getUriFromPath(getContext().filesDir + "/image.png").toString();
      photoAccessHelper.getPhotoAccessHelper(getContext()).showAssetsCreationDialog([boxPath],
        [photoCreationConfig]).then((result) => {
        console.log(`result = ${JSON.stringify(result)}`);
      });
      await driveFn();
      let code: number = EventType.SELECT_ITEM_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let callback = (event: events_emitter.EventData) => {
        let result: ItemInfo = event?.data?.msg;
        console.info('testPicker59 select ItemInfo=:' + JSON.stringify(result));
        expect(result.videoMode).assertUndefined();
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
      console.info("testPicker59 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await CommonFunc.sleep(2000);

      let checkBoxs: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info("testPicker59 findComponent checkbox fail");
      } else {
        console.info("testPicker59 findComponent checkbox success");
        await checkBoxs[0].click();
        await CommonFunc.sleep(2000);
        console.info("testPicker59 btn click finish");
      }
      router.back();
      console.info("testPicker59 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
      * @tc.number      testPicker60
      * @tc.name        testPicker60
      * @tc.desc        Testing EdgeEffect
      * @tc.size        MediumTest
      * @tc.type        Function
      * @tc.level       Level 0
      */
    it('testPicker60', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.edgeEffect = EdgeEffect.None;
      let callback = (event: events_emitter.EventData) => {
        let expectResult: EdgeEffect = EdgeEffect.None;
        let result: PhotoPickerResult = event?.data?.msg.edgeEffect ?? EdgeEffect.Spring;
        console.info('testPicker60 result event.data.msg=:' + result);
        console.info('testPicker60 result expect =:' + expectResult);
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
      console.info("testPicker60 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicker60 finish");
      events_emitter.off(event.eventId);
      done();
    });
    
    /**
     * @tc.number     testPicker61
     * @tc.name       testPicker61
     * @tc.desc       Testing maxVideoSelectNumber and maxPhotoSelectNumber
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPicker61', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      console.info('testPicker61 started');
      let sheetPickerOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      sheetPickerOptions.maxVideoSelectNumber = 5;
      sheetPickerOptions.maxPhotoSelectNumber = 7;
      let passed = true;

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheetPicker',
        params: {
          pickerOptions: sheetPickerOptions,
        }
      };
      await routeToUrl(options);
      await CommonFunc.sleep(2000);
      let button: Component = await driver.findComponent(ON.id('btnSelectPhoto'));
      await button.click();
      console.info('testPicker61 Clicked select button');
      await CommonFunc.sleep(2000);
      router.back();
      console.info('testPicker61 finished');
      expect(passed).assertTrue();
      done();
    });

    /**
    * @tc.number     testPicker62
    * @tc.name       testPicker62
    * @tc.desc       Testing select errCode
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testPicker62', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.maxSelectNumber = 1;
      pickerOptions.singleSelectionMode = photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE;
      let state: photoAccessHelper.MovingPhotoBadgeStateType = photoAccessHelper.MovingPhotoBadgeStateType.NOT_MOVING_PHOTO;
      pickerOptions.globalMovingPhotoState = state;
      let photoPicker = new photoAccessHelper.PhotoViewPicker();
      try {
        photoPicker.select(pickerOptions).then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.log('select错误码覆盖 PhotoViewPicker.select success, PhotoPickerResult uri: ' +
          JSON.stringify(photoSelectResult))
          // expect(true).assertTrue();
        })
      } catch (error) {
        console.error("select错误码覆盖 error:" + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(23800151);
      }
      console.info('select错误码覆盖 finish');
      done();
    });

    /**	 
     * @tc.number     testPicker63	 
     * @tc.name       testPicker63	 
     * @tc.desc       Testing showSingleAssetCreationDialogEx with isImageFullyDisplayed param.	 
     * @tc.size       MediumTest	 
     * @tc.type       Function	 
     * @tc.level      Level 0	 
     */	 
    it('testPicker63', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      const context = getContext();
      const creationSetting: photoAccessHelper.PhotoCreationConfig = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
      };
      const boxPath = fileUri.getUriFromPath(context.filesDir + '/test.jpg').toString();
      const isImageFullyDisplayed = true;
      try {
        photoAccessHelper
          .getPhotoAccessHelper(context)
          .showAssetsCreationDialogEx([boxPath], [creationSetting])
          .then(result => {
            if (!result) {
              expect(result).assertUndefined();
            } else if (result.length === 0) {
              expect(result).not().assertUndefined();
              expect(result.length === 0).assertTrue();
            } else {
              expect(result).not().assertUndefined();
              expect(result.length > 0).assertTrue();
              expect(result[0].endsWith("test.jpg"));
            }
          })
        await driveFn();
      } catch(error) {
        console.error(" error: " + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(23800301);
      }

      try {
        photoAccessHelper
          .getPhotoAccessHelper(context)
          .showSingleAssetCreationDialogEx(boxPath, creationSetting, isImageFullyDisplayed)
          .then((testResult) => {
            console.info('testPicker63 showSingleAssetCreationDialogEx success');
            console.info('testPicker63 success');
            expect(testResult).not().assertUndefined();
            expect(true).assertTrue();
          })
        await driveFn();
      } catch(error) {
        console.error(" error: " + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(23800301);
      } finally {
        done();
      }
    });

    /**
     * @tc.name   testPicker64
     * @tc.number testPicker64
     * @tc.desc   Testing  change PhotoPickerComponent pickerOptions gridPinchMode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker64',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      pickerOptions.gridPinchMode = {
        gridPinchModeType: photoAccessHelper.GridPinchModeType.FULL_FUNCTION_GRID,
        defaultGridLevel: photoAccessHelper.GridLevel.COMPACT
      };
      let callback = (event: events_emitter.EventData) => {
        let expectResult: photoAccessHelper.GridLevel = pickerOptions.gridPinchMode?.defaultGridLevel ?? photoAccessHelper.GridLevel.STANDARD;
        let result: PhotoPickerResult = event?.data?.msg;
        console.info('testPicker64 result event.data.msg =' + result?.gridPinchMode?.defaultGridLevel);
        console.info('testPicker64 result expect = ' + expectResult);
        expect(result?.gridPinchMode?.defaultGridLevel).assertEqual(expectResult);
        expect(photoAccessHelper.GridLevel.COMPACT).assertEqual(2);
        expect(photoAccessHelper.GridLevel.STANDARD).assertEqual(1);
        expect(photoAccessHelper.GridLevel.SPACIOUS).assertEqual(0);
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
      console.info("testPicker64 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      await clickResultButton(driver);
      router.back();
      console.info("testPicker64 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.name   testPicker65
     * @tc.number testPicker65
     * @tc.desc   Testing isReturnToPhotoBrowserEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker65',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let sheetPickerOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      sheetPickerOptions.isReturnToPhotoBrowserEnabled = false;
      try{
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(sheetPickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
          console.info('testPicker65, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
        })
      } catch(err) {
        expect(false).assertTrue();
        console.error(`testPicker65, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
      }
      console.info("testPicker65 finish");
      done();
    });

    /**
     * @tc.name   testPicker66
     * @tc.number testPicker66
     * @tc.desc   Testing MovingPhotoBadgeStateType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker66',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let state: photoAccessHelper.MovingPhotoBadgeStateType = 
        photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_ENABLED;
      pickerOptions.globalMovingPhotoState = state;
      let pickerController: PickerController = new PickerController();
      pickerController.setMovingPhotoState(state);

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
        }
      }
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      try {
        pickerController.setMovingPhotoState(state);
      } catch (e) {
         console.log(`testPicker66, r1=${JSON.stringify(e)}, code  ${e.code} msg=${e.message}`);
      }

      try {
        // 非法场景错误码覆盖
        pickerController.setMovingPhotoState(-1);
      } catch (e) {
         console.log(`testPicker66, r2=${JSON.stringify(e)}`);
         expect( e.code).assertEqual(23800151);
      }

      try {
        // 非法场景错误码覆盖
        pickerController.setMovingPhotoState(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_ENABLED);
      } catch (e) {
         console.log(`testPicker66, r3=${JSON.stringify(e)}`);
         expect( e.code).assertEqual(23800202);
      }

      await CommonFunc.sleep(2000);
      router.back();
      console.info("testPicker66 finish");
      done();
    });
 	 
    /**
     * @tc.name   testPicker67
     * @tc.number testPicker67
     * @tc.desc   Testing requestPhotoUrisReadPermissionEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker67',Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let uris = ['file://media/photo/test.jpg'];
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      console.log("testPicker67 start");
      let requestPhotoUrisReadPermission = {
        authorizedUris: ['file://media/photo/test.jpg'],
        invalidUris: []
      } as photoAccessHelper.RequestReadPermissionResult;
      console.log("testPicker67 RequestReadPermissionResult");
      try {
        phAccessHelper.requestPhotoUrisReadPermissionEx(uris).then((result) => {
          console.info("requestPhotoUrisReadPermissionEx, result = " + JSON.stringify(result));
          if (result) {
            expect(true).assertTrue();
            expect(requestPhotoUrisReadPermission.authorizedUris).assertEqual(uris);
            expect(requestPhotoUrisReadPermission.invalidUris).assertEqual([]);
            console.info('success');
          } else {
            console.error("testPicker67 empty result");
            expect(false).assertTrue();
          }
        })
      } catch(error) {
        console.error("testPicker67 error: " + JSON.stringify(error));
        expect(error.code).assertEqual(23800301);
      }
      console.info("testPicker67 finish");
      done();
    });

    /**
     * @tc.name   testPicker68
     * @tc.number testPicker68
     * @tc.desc   Testing PickerOptions autoPlayScenes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker68', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
    
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
    
      pickerOptions.autoPlayScenes = [
        {
          sceneType: photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER,
          playMode: photoAccessHelper.PlayMode.AUTO_PLAY
        },
        {
          sceneType: photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE,
          playMode: photoAccessHelper.PlayMode.AUTO_PLAY
        }
      ];
    
      let callback = (event: events_emitter.EventData) => {
        let msg: PhotoPickerResult = event?.data?.msg;
        let result: photoAccessHelper.AutoPlayScene[] = msg.autoPlayScenes;
        let expectResult: photoAccessHelper.AutoPlayScene[] = pickerOptions.autoPlayScenes ?? [];
        console.info('testPicker68 result: ' + JSON.stringify(result));
        console.info('testPicker68 expect: ' + JSON.stringify(expectResult));
        expect(result).assertDeepEquals(expectResult);
      };
    
      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      };
      events_emitter.on(event, callback);
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions
        }
      };
      await routeToUrl(options);
      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info('testPicker68 JSON.parse(strJson) is ' + strJson);
      expect(JSON.parse(strJson).$attrs.visibility)
        .assertEqual('Visibility.Visible');
    
      await clickResultButton(driver);
      router.back();
    
      events_emitter.off(event.eventId);
      console.info('testPicker68 finish');
      done();
    });

    /**
     * @tc.number      testPicker69
     * @tc.name        testPicker69
     * @tc.desc        Testing PhotoPickerComponent pickerOptions's appAlbumFilters property
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testPicker69', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
    
      let code: number = EventType.PHOTO_PICKER_INFO;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
    
      const testBundleName = 
        ['com.example.sourceapp.album', 'com.example.sourceapp.album1', 'com.example.sourceapp.album2'];
      pickerOptions.appAlbumFilters = testBundleName;
    
      let callback = (event: events_emitter.EventData) => {
      
        let expectResult: Array<string> = pickerOptions.appAlbumFilters ?? [];
        let result: Array<string> = event?.data?.msg.appAlbumFilters;
    
        console.info('testPicker69 result event.data.msg.appAlbumFilters=:' + result);
        console.info('testPicker69 result expect =:' + expectResult);
    
        expect(result).assertDeepEquals(expectResult);
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
      console.info("testPicker69 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
    
      await clickResultButton(driver);
    
      router.back();
      console.info("testPicker69 finish");
      events_emitter.off(event.eventId);
      done();
    });

    /**
     * @tc.name   testPicker70
     * @tc.number testPicker70
     * @tc.desc   Testing onItemClickedNotify and SET_CLICK_RESULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPicker70', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let code: number = EventType.ITEM_CLICKED_NOTIFY;
      let pickerOptions: PickerOptions = getDefaultPickerOptions();
      let pickerController: PickerController = new PickerController();

      const handleItemClickedNotify = (event: events_emitter.EventData) => {
        let clickInfo: ClickInfo = event?.data?.msg;
        let result = clickInfo.itemInfo;

        console.info('testPicker70 select ItemInfo=:' + JSON.stringify(result));
        expect(result.itemType).not().assertUndefined();
        expect(result.uri).not().assertUndefined();
        expect(result.mimeType).not().assertUndefined();
        expect(result.width).not().assertUndefined();
        expect(result.height).not().assertUndefined();
        expect(result.size).not().assertUndefined();
        expect(result.duration).not().assertUndefined();
        expect(result.photoSubType).not().assertUndefined();
        expect(result.dynamicRangeType).not().assertUndefined();
        expect(result.orientation).not().assertUndefined();
        expect(clickInfo.clickType).assertEqual(ClickType.SELECTED);

        triggerPhotoPickerInfoEvent(result.uri ?? '');
      }

      const handlePhotoPickerInfo = (event: events_emitter.EventData, expectedUri: string) => {
        let selectResult: PhotoPickerResult = event?.data?.msg.preselectedUris;
        console.info('testPicker70 result event.data.msg=:' + selectResult);
        console.info('testPicker70 result expect =:' + expectedUri);
        expect(selectResult).assertEqual([expectedUri]);
      }

      const triggerPhotoPickerInfoEvent = (uri: string) => {
        let code: number = EventType.PHOTO_PICKER_INFO;
        let callback = (event: events_emitter.EventData): void => handlePhotoPickerInfo(event, uri);
  
        let selectEvent: events_emitter.InnerEvent = {
          eventId: code,
          priority: events_emitter.EventPriority.LOW
        };
        events_emitter.on(selectEvent, callback);
  
        const clickResult = [{
          uri: uri,
          isSelected: true
        } as ClickResult];
  
        pickerController.addData(DataType.SET_ITEM_CLICK_RESULT, clickResult);
      }

      let event: events_emitter.InnerEvent = {
        eventId: code,
        priority: events_emitter.EventPriority.LOW
      };
      events_emitter.on(event, handleItemClickedNotify);

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PickerComponent',
        params: {
          eventId: code,
          pickerOptions: pickerOptions,
          isOnItemClickedNotifySet: true
        }
      };

      await routeToUrl(options);

      let strJson: string = getInspectorByKey('PhotoPickerComponent');
      console.info("testPicker70 JSON.parse(strJson) is" + strJson);
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');

      await CommonFunc.sleep(2000);

      let checkBoxs: Array<Component> = await driver.findComponents(ON.type('Checkbox'));
      if (checkBoxs === null || checkBoxs.length <= 0) {
        console.info("testPicker70 findComponent checkbox fail");
      } else {
        console.info("testPicker70 findComponent checkbox success");
        await checkBoxs[0].click();
        await CommonFunc.sleep(2000);
        console.info("testPicker70 btn click finish");
      }

      events_emitter.off(event.eventId);
      events_emitter.off(EventType.PHOTO_PICKER_INFO);

      router.back();
      console.info("testPicker70 finish");
      done();
    });
    
    /**
     * @tc.number     testPicker71
     * @tc.name       testPicker71
     * @tc.desc       Testing showAssetsCreationDialogEx
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPicker71', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let context = getContext();
      let originalUris = [' '];
      let CreationSettingDef: photoAccessHelper.CreationSetting = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(context.filesDir + "/test.jpg").toString();
        photoAccessHelper.getPhotoAccessHelper(context).showAssetsCreationDialogEx([boxPath],
          [CreationSettingDef]).then((result) => {
          if (!result) {
            expect(result).assertUndefined();
          } else if (result.length === 0) {
            expect(result).not().assertUndefined();
            expect(result.length === 0).assertTrue();
          } else {
            expect(result).not().assertUndefined();
            expect(result.length > 0).assertTrue();
            expect(result[0].endsWith("test.jpg"));
          }
          originalUris = result;
        });
        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, () => {
          console.log("testPicker71 replacePhotoPickerPreview callback called");
          pickerController.saveTrustedPhotoAssets([boxPath], (err, savedUris) => {
            if (!err) {
              console.log("testPicker71 saveTrustedPhotoAssets fail");
              expect(false).assertTrue();
            } else {
              console.log("testPicker71 saveTrustedPhotoAssets success, save uris:" + savedUris);
            }
          }, undefined, SaveMode.SAVE_AS);
        });
      } catch (error) {
        console.log("testPicker71 error:" + JSON.stringify(error));
        expect(false).assertTrue();
      }
      await CommonFunc.sleep(1000);
      console.log("testPicker71 btn click finish");
      done();
    });
    
    /**
     * @tc.number     testPicker72
     * @tc.name       testPicker72
     * @tc.desc       Testing createAssetWithShortTermPermissionEx
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPicker72', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(getContext());
      try {
        let CreationSettingDef: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
        };
        phAccessHelper.createAssetWithShortTermPermissionEx(CreationSettingDef).then((result) => {
          console.info("createAssetWithShortTermPermission, result=" + JSON.stringify(result));
          if (result) {
            console.info('success');
          } else {
            console.error("testPicker72 empty result");
            expect(false).assertTrue();
          }
        })
      } catch(error) {
        console.error(" error: " + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(14000011);
      }
      console.info("testPicker72 finish");
      done();
    });
    
    /**
     * @tc.number     testPicker73
     * @tc.name       testPicker73
     * @tc.desc       Testing saveTrustedPhotoAssetsEx
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testPicker73', Level.LEVEL0, async (done: Function) => {
      if (!isExecutePicker) {
        done();
        return;
      }
      let context = getContext();
      let originalUris = [' '];
      let CreationSettingDef: photoAccessHelper.CreationSetting = {
        title: 'test',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
      };
      try {
        let pickerController: PickerController = new PickerController();
        let boxPath = fileUri.getUriFromPath(context.filesDir + "/test.jpg").toString();
        photoAccessHelper.getPhotoAccessHelper(context).showAssetsCreationDialogEx([boxPath],
          [CreationSettingDef]).then((result) => {
            if (!result) {
              expect(result).assertUndefined();
            } else if (result.length === 0) {
              expect(result).not().assertUndefined();
              expect(result.length === 0).assertTrue();
            } else {
              expect(result).not().assertUndefined();
              expect(result.length > 0).assertTrue();
              expect(result[0].endsWith("test.jpg"));
            }
            originalUris = result;
        });
        await driveFn();
        await CommonFunc.sleep(500);

        pickerController.replacePhotoPickerPreview(originalUris[0], boxPath, (error) => {
          console.log("testPicker73 replacePhotoPickerPreview callback called");
          if (!error) {
            console.log("testPicker73 replacePhotoPickerPreview fail");
            expect(false).assertTrue();
          } else {
            console.log("testPicker73 replacePhotoPickerPreview success");
            pickerController.saveTrustedPhotoAssetsEx([boxPath]).then((result1) => {
              if (!result1) {
                console.log("testPicker73 saveTrustedPhotoAssets (1 param) fail, save uris:" + JSON.stringify(result1));
                expect(result1).assertUndefined();
              } else if (result1.length === 0) {
                expect(result1).not().assertUndefined();
                expect(result1.length === 0).assertTrue();
              } else {
                console.log("testPicker73 saveTrustedPhotoAssets (1 param) success, save uris:" + JSON.stringify(result1));
                expect(result1).not().assertUndefined();
                expect(result1.length > 0).assertTrue();
              }
            })
            pickerController.saveTrustedPhotoAssetsEx([boxPath], [CreationSettingDef]).then((result2)=>{
              if (!result2) {
                console.log("testPicker73 saveTrustedPhotoAssets (2 param) fail, save uris:" + JSON.stringify(result2));
                expect(result2).assertUndefined();
              } else if (result2.length === 0) {
                expect(result2).not().assertUndefined();
                expect(result2.length === 0).assertTrue();
              } else {
                console.log("testPicker73 saveTrustedPhotoAssets (2 param) success, save uris:" + JSON.stringify(result2));
                expect(result2).not().assertUndefined();
                expect(result2.length > 0).assertTrue();
              }
            })
            pickerController.saveTrustedPhotoAssetsEx([boxPath], [CreationSettingDef], SaveMode.SAVE_AS).then((result3)=> {
              if (!result3) {
                console.log("testPicker73 saveTrustedPhotoAssets (3 param) fail, save uris:" + JSON.stringify(result3));
                expect(result3).assertUndefined();
              } else if (result3.length === 0) {
                expect(result3).not().assertUndefined();
                expect(result3.length === 0).assertTrue();
              } else {
                console.log("testPicker73 saveTrustedPhotoAssets (3 param) success, save uris:" + JSON.stringify(result3));
                expect(result3).not().assertUndefined();
                expect(result3.length > 0).assertTrue();
              }
            })
          }
        });
      } catch (error) {
        console.log("testPicker73 error:" + JSON.stringify(error));
        expect(false).assertTrue();
      } finally {
        await CommonFunc.sleep(1000);
        console.log("testPicker73 btn click finish");
        done();
      }
    });

    /**
      * @tc.name   testPicker74
      * @tc.number testPicker74
      * @tc.desc   Testing recommendationTypeList
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('testPicker74',Level.LEVEL0, async (done: Function) => {
        if (!isExecutePicker) {
          done();
          return;
        }
        let pickerOptions: PickerOptions = getDefaultPickerOptions();
        pickerOptions.recommendationOptions = {
          recommendationTypeList: [photoAccessHelper.RecommendationType.CAT, photoAccessHelper.RecommendationType.DOG, 
          photoAccessHelper.RecommendationType.ARCHITECTURE, photoAccessHelper.RecommendationType.LANDSCAPE],
        }

        try{
          let photoPicker = new photoAccessHelper.PhotoViewPicker();
          photoPicker.select(pickerOptions).then((PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
            console.info('testPicker74, PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
            JSON.stringify(PhotoSelectResult));
          })
        } catch(err) {
          expect(false).assertTrue();
          console.error(`testPicker74, PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
        }
        console.info("testPicker74 finish");
        done();
      });

    /**
      * @tc.name   testPicker75
      * @tc.number testPicker75
      * @tc.desc   Testing PhotoViewPicker.select with callback
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
      it('testPicker75',Level.LEVEL0, async (done: Function) => {
        if (!isExecutePicker) {
          done();
          return;
        }
        let pickerOptions: PickerOptions = getDefaultPickerOptions();
        let state: photoAccessHelper.MovingPhotoBadgeStateType = 
          photoAccessHelper.MovingPhotoBadgeStateType.NOT_MOVING_PHOTO;
        pickerOptions.globalMovingPhotoState = state;
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        try{
          photoPicker.select(pickerOptions, (err: BusinessError, PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
            if (err) {
              console.error(`select callback错误码覆盖 failed with err: ${err.code}, ${err.message}`);
              return ;
            }
            console.info('select callback错误码覆盖 successfully,uri:' + JSON.stringify(PhotoSelectResult));
          })
        } catch(error) {
          console.error(`testPicker75, PhotoViewPicker.select failed with err: ${error.code}, ${error.message}`);
          expect(error.code).assertEqual(23800151);
        }
        console.info("testPicker75 finish");
        done();
      });
  })
}
