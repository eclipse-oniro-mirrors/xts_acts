/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import pipWindow from '@ohos.PiPWindow';

let sleep = async (time:number):Promise<void> => {
  let timeoutId:number | null = null;
  await new Promise((resolve: (value: string) => void) => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  });
  clearTimeout(timeoutId)
}

let pipController: pipWindow.PiPController | undefined = undefined;
let pipController2: pipWindow.PiPController | undefined = undefined;
let pipController3: pipWindow.PiPController | undefined = undefined;
let pipController4: pipWindow.PiPController | undefined = undefined;
let mXComponentController: XComponentController = new XComponentController();
let mXComponentController2: XComponentController = new XComponentController();
let mXComponentController3: XComponentController = new XComponentController();
let mXComponentController4: XComponentController = new XComponentController();
let navId: string = '';
let contentWidth: number = 300;
let contentHeight: number = 300;
let config1: pipWindow.PiPConfiguration = {
  context: getContext(this),
  componentController: mXComponentController,
  navigationId: navId,
  templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
  contentWidth: contentWidth,
  contentHeight: contentHeight,
  defaultWindowSizeType: 2
};

let config2: pipWindow.PiPConfiguration = {
  context: getContext(this),
  componentController: mXComponentController2,
  navigationId: navId,
  templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
  contentWidth: contentWidth,
  contentHeight: contentHeight,
  defaultWindowSizeType: undefined
};

let config3: pipWindow.PiPConfiguration = {
  context: getContext(this),
  componentController: mXComponentController3,
  navigationId: navId,
  templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
  contentWidth: contentWidth,
  contentHeight: contentHeight,
  defaultWindowSizeType: 0
};

let config4: pipWindow.PiPConfiguration = {
  context: getContext(this),
  componentController: mXComponentController4,
  navigationId: navId,
  templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
  contentWidth: contentWidth,
  contentHeight: contentHeight,
  defaultWindowSizeType: 1
};

@Entry
@Component
struct Second {
  aboutToAppear() {
    console.info('StartAbility second aboutToAppear')
  }
  @State getPipWindowInfoText1: string = '';
  @State getPipWindowInfoText2: string = '';
  @State getPipWindowInfoText3: string = '';
  @State getPipWindowInfoText4: string = '';
  @State isSupported: number = 0;
  build() {
    Stack() {
      Column() {
        Button(this.isSupported.toString())
          .id('isSupported')
          .height('5%')
          .fontSize(10)
        Row() {
          Button() {
            Text('Create1')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('CreatePipWindow1')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            let promise : Promise<pipWindow.PiPController> = pipWindow.create(config1);
            promise.then(async (data : pipWindow.PiPController) => {
              this.isSupported = 0;
              pipController = data;
              console.info(`Succeeded in creating pip controller. Data:${data}`);
              await pipController.startPiP();
              console.log(`Succeeded startPiP`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button(this.getPipWindowInfoText1) {
            Text('GetInfo1')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('GetPiPWindowInfo1')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController!.getPiPWindowInfo().then(async (data : pipWindow.PiPWindowInfo) => {
              this.isSupported = 0
              this.getPipWindowInfoText1 = data.size.scale.toString()
              console.info(`Succeeded in getPiPWindowInfo. Data:${JSON.stringify(data)}`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('Stop1')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('StopPiPWindow1')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController!.stopPiP().then(async () => {
              this.isSupported = 0
              console.info(`Succeeded in stopPiP.`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to stopPiP. Cause:${err.code}, message:${err.message}`);
            });
          })
          Button(this.getPipWindowInfoText1)
            .id('PipWindowInfoText1')
            .width('30%')
            .height('100%')
            .fontSize(10)
        }.height('5%')
        

        Row() {
          Button() {
            Text('Create2')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('CreatePipWindow2')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            let promise : Promise<pipWindow.PiPController> = pipWindow.create(config2);
            promise.then(async (data : pipWindow.PiPController) => {
              this.isSupported = 0
              pipController2 = data;
              console.info(`Succeeded in creating pip controller. Data:${data}`);
              await pipController2.startPiP();
              console.log(`Succeeded startPiP`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('GetInfo2')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('GetPiPWindowInfo2')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController2!.getPiPWindowInfo().then(async (data : pipWindow.PiPWindowInfo) => {
              this.isSupported = 0
              this.getPipWindowInfoText2 = data.size.scale.toString()
              console.info(`Succeeded in getPiPWindowInfo. Data:${JSON.stringify(data)}`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('Stop2')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('StopPiPWindow2')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController2!.stopPiP().then(async () => {
              this.isSupported = 0
              console.info(`Succeeded in stopPiP.`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to stopPiP. Cause:${err.code}, message:${err.message}`);
            });
          })
          Button(this.getPipWindowInfoText2)
            .id('PipWindowInfoText2')
            .width('30%')
            .height('100%')
            .fontSize(10)
        }.height('5%')
        

        Row() {
          Button() {
            Text('Create3')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('CreatePipWindow3')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            let promise : Promise<pipWindow.PiPController> = pipWindow.create(config3);
            promise.then(async (data : pipWindow.PiPController) => {
              this.isSupported = 0
              pipController3 = data;
              console.info(`Succeeded in creating pip controller. Data:${data}`);
              await pipController3.startPiP();
              console.log(`Succeeded startPiP`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('GetInfo3')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('GetPiPWindowInfo3')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController3!.getPiPWindowInfo().then(async (data : pipWindow.PiPWindowInfo) => {
              this.isSupported = 0
              this.getPipWindowInfoText3 = data.size.scale.toString()
              console.info(`Succeeded in getPiPWindowInfo. Data:${JSON.stringify(data)}`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('Stop3')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('StopPiPWindow3')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController3!.stopPiP().then(async () => {
              this.isSupported = 0
              console.info(`Succeeded in stopPiP.`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to stopPiP. Cause:${err.code}, message:${err.message}`);
            });
          })
          Button(this.getPipWindowInfoText3)
            .id('PipWindowInfoText3')
            .width('30%')
            .height('100%')
            .fontSize(10)
        }.height('5%')
        

        Row() {
          Button() {
            Text('Create4')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('CreatePipWindow4')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            let promise : Promise<pipWindow.PiPController> = pipWindow.create(config4);
            promise.then(async (data : pipWindow.PiPController) => {
              this.isSupported = 0
              pipController4 = data;
              console.info(`Succeeded in creating pip controller. Data:${data}`);
              await pipController4.startPiP();
              console.log(`Succeeded startPiP`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('GetInfo4')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('GetPiPWindowInfo4')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController4!.getPiPWindowInfo().then(async (data : pipWindow.PiPWindowInfo) => {
              this.isSupported = 0
              this.getPipWindowInfoText4 = data.size.scale.toString()
              console.info(`Succeeded in getPiPWindowInfo. Data:${JSON.stringify(data)}`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            });
          })

          Button() {
            Text('Stop4')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
          }.type(ButtonType.Capsule)
          .id('StopPiPWindow4')
          .backgroundColor('#0D9FFB')
          .height('100%')
          .width('20%')
          .onClick(()=>{
            pipController4!.stopPiP().then(async () => {
              this.isSupported = 0
              console.info(`Succeeded in stopPiP.`);
            }).catch((err: BusinessError) => {
              this.isSupported = err.code;
              console.error(`Failed to stopPiP. Cause:${err.code}, message:${err.message}`);
            });
          })
          Button(this.getPipWindowInfoText4)
            .id('PipWindowInfoText4')
            .width('30%')
            .height('100%')
            .fontSize(10)
        }.height('5%')
        

      }
      .width('100%')
      .position({bottom:'0%'})

    }
    .height('100%')
  }
}