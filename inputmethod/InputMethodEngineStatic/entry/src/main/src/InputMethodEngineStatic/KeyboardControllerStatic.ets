 'use static'

import { inputMethodEngine, InputMethodExtensionContext, InputMethodSubtype, InputMethodExtraConfig } from '@kit.IMEKit';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import util from '@ohos.util';
import { window } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import { LocalStorage } from '@ohos.arkui.stateManagement';
import Utils from '../test/Util.test';
let domain: int = 0x0000;
let TAG: string = 'keyboardControllerStatic';


let inputMethodAbility: inputMethodEngine.InputMethodAbility | null = inputMethodEngine.getInputMethodAbility();
let inputKeyboardDelegate: inputMethodEngine.KeyboardDelegate | null = inputMethodEngine.getKeyboardDelegate();

export class KeyboardControllerStatic {
  private mContext: InputMethodExtensionContext | undefined = undefined;
  private windowName: string = 'inputApp';
  private windowHeight: int = 0;
  private windowWidth: int = 0;
  private nonBarPosition: int = 0;
  private keyboardController: inputMethodEngine.KeyboardController | undefined;
  private InputClient: inputMethodEngine.InputClient | undefined;
  private capitalizeMode: inputMethodEngine.CapitalizeMode | undefined;
  private placeholder: string = '';
  private abilityName: string = '';
  private displayInfo: display.Display | null = display.getDefaultDisplaySync();
  private softKeyboardPanel: inputMethodEngine.Panel | null = null;
  private STATUS_BARPanel: inputMethodEngine.Panel | null = null;
  private immersive: int = 0;
  private storage: LocalStorage;


  constructor(context: InputMethodExtensionContext) {
    this.mContext = context;
    this.storage = new LocalStorage();
    this.storage.setOrCreate('storageSimplePorp', 121);
    this.windowWidth = this.displayInfo!.width.toInt();
    this.windowHeight = Math.floor(this.displayInfo!.height * 0.45).toInt();
  }

  private newArrayBuffer = (str: string | undefined): ArrayBuffer => {
    let arrayBuffer = new ArrayBuffer(0);
    if(str === undefined){
      const view = new Uint8Array(arrayBuffer);
    }else{
      arrayBuffer = new ArrayBuffer(str.length);
      const view = new Uint8Array(arrayBuffer);
      for(let i=0; i<str.length; i++){
        view[i] = str.charCodeAt(i);
      }
    }
    return arrayBuffer;
  }


  private GetArrayBufferString = (buffer: ArrayBuffer): string => {
     console.info(`${TAG} ====> GetArrayBufferString buffer: ${JSON.stringify(buffer)}`);
     const decoder = util.TextDecoder.create('"utf-8"');
     const str = decoder.decodeToString(new Uint8Array(buffer));
     return str
  }

  private async testTemplete(testName: string, assertFunction: ()=> Promise<boolean>): Promise<void>{
    console.info(`${TAG} ====> receive: ${testName}`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData ={
      data: 'FAILED'
    };
    try {
      if (await assertFunction()=== true) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    }catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====> ${testName} catch err: ${JSON.stringify(err)}`);
    }
    commonEventManager.publish(testName, commonEventPublishData, this.publishCallback);
  }

  private async wrapAssertWithTwoIn1Judgement1(assertRunnable: () => Promise<boolean>): Promise<() => Promise<boolean>> {
    return () => assertRunnable();
  }

  public onCreate(): void {
    let that = this;

    let panelInfo: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag: inputMethodEngine.PanelFlag.FLG_FLOATING
    }

    inputMethodAbility!.createPanel(this.mContext!, panelInfo, (err: BusinessError<void> | null, panel: inputMethodEngine.Panel | undefined) => {
      if(err){
        console.info(`${TAG} ====> Failed to create panel. err.code: ${err?.code}, err.message: ${err?.message}`);
      }
      this.softKeyboardPanel = panel as inputMethodEngine.Panel;
      console.info(`${TAG} ====> Succeed in creating panel.  panel: ${JSON.stringify(this.softKeyboardPanel)}`);
      this.softKeyboardPanel!.setUiContent('pages/Second', (err) => {
        console.info(`${TAG} ====> Success in setUiContent`);
      })
    })

    try{
      let subscriberCallback = (err: BusinessError | null,
        data: commonEventManager.CommonEventData | undefined | null) => {
          console.info(`${TAG} ====> receive event data.  panel: ${JSON.stringify(data)}`);
          if(data != undefined) {
            switch (data.code) {
              case 1:
                console.info(`${TAG} ====> inputMethodEngine_test_static_038 event: ${JSON.stringify(data.event)}`);
                that.inputMethodEngine_test_static_038();
                break;
              case 2:
                console.info(`${TAG} ====> Sub_InputMethod_IME_createPanelCallback_static_0100 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_createPanelCallback_static_0100();
                break;
              case 3:
                console.info(`${TAG} ====> Sub_InputMethod_IME_PrivateDateTransferred_static_0500 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_PrivateDateTransferred_static_0500();
                break;
              case 4:
                console.info(`${TAG} ====> Sub_InputMethod_IME_PrivateDateTransferred_static_0600 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_PrivateDateTransferred_static_0600();
                break;
              case 5:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0900 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0900();
                break;
              case 6:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0200 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0200();
                break;
              case 7:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0800 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0800();
                break;
              case 8:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0400 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0400();
                break;
              case 9:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0300 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0300();
                break;
              case 10:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_1100 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_1100();
                break;
              case 11:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0901 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0901();
                break;
              case 12:
                console.info(`${TAG} ====> Sub_InputMethod_IME_Custom_static_0902 event: ${JSON.stringify(data.event)}`);
                that.Sub_InputMethod_IME_Custom_static_0902();
                break;            
            }
          }
        }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['keyboardControllerStatic']
      };

      let subscriber: commonEventManager.CommonEventSubscriber;
      try{
        let data = commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        if(data != undefined) {
          subscriber = data as commonEventManager.CommonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info(`${TAG} ====> scene subscribe finish!`);
        }
      } catch(error){
        let err: BusinessError = error as BusinessError;
        console.info(`${TAG} ====>createSubscriber err: ${JSON.stringify(err.message)}`);
      }
    }catch(err){
      console.info(`${TAG} ====>createSubscriber err: ${JSON.stringify(err.message)}`);
    }

    inputMethodAbility!.onInputStart((controller: inputMethodEngine.KeyboardController,
      inputClient: inputMethodEngine.InputClient): void=>{
        this.keyboardController = controller;
        this.InputClient = inputClient;
        console.info(`${TAG} ====> inputMethodAbility inputStart into!`);
      })    
  }

  private publishCallback = (err: BusinessError | null): void => {
    if (err) {
      console.error(`${TAG} ====>publish failed: ${JSON.stringify(err)}`);
      return;
    }
    console.debug(`${TAG} ====>publish commonevent Succeed`);      
  }

  private async wrapAssertWithTwoIn1Judgement(assertRunnable: () => Promise<boolean>): Promise<() => Promise<boolean>>{
    try{
      return ()=> assertRunnable();
    } catch (err) {
      console.info(TAG + '====>catch err:' + JSON.stringify(err));
      return ()=> Promise.resolve(false);
    }
  }

  public onDestroy(): void {
    console.debug(`${TAG} ====>onDestroy`);
  }
  
  async inputMethodEngine_test_static_038(): Promise<void> {
    console.info(`${TAG} ====>receive inputMethodEngine_test_static_038`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    }
    this.InputClient!.getEditorAttribute((err, value) => {
      if (err){
        console.info(`${TAG} ====>receive inputMethodEngine_test_static_038 getEditorAttribute err: ${JSON.stringify(err)}`);
      } else {
        console.info(`${TAG} ====>receive inputMethodEngine_test_static_038 getEditorAttribute value: ${JSON.stringify(value)}`);
        if (typeof (value!.enterKeyType) === 'int' && typeof (value!.inputPattern) === 'int' &&
         typeof (value!.isTextPreviewSupported) === 'boolean' && typeof (value!.windowId) === 'int' &&
 	       typeof (value!.placeholder) === 'string' && typeof (value!.immersiveMode) === 'int' &&
 	       typeof (value!.gradientMode) === 'int' && typeof (value!.extraConfig) === 'object' &&
 	       typeof (value!.capitalizeMode) === 'int' && typeof (value!.bundleName) === 'string' &&
 	       typeof (value!.displayId) === 'long' && typeof (value!.abilityName) === 'string') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      }
      commonEventManager.publish('inputMethodEngine_test_static_038', commonEventPublishData, this.publishCallback);
    })
  }

  private async Sub_InputMethod_IME_createPanelCallback_static_0100(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    }
    let panelInfo1: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.STATUS_BAR,
      flag: inputMethodEngine.PanelFlag.FLG_FLOATING
    };
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_createPanelCallback_static_0100`);
    try {
      inputMethodAbility?.createPanel(this.mContext!, panelInfo1, (err: BusinessError<void> | null,
        panel: inputMethodEngine.Panel | undefined) => {
          console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel success!`);
          if (err) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel err: ${JSON.stringify(err)}`);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 createPanel: ${JSON.stringify(panel)}`);
          };
          if (panel !== undefined) {
            this.STATUS_BARPanel = panel as inputMethodEngine.Panel;
            inputMethodAbility!.destroyPanel(panel);
          }
          commonEventManager.publish('Sub_InputMethod_IME_createPanelCallback_static_0100', commonEventPublishData, this.publishCallback);
        })
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_createPanelCallback_static_0100 catch err: ${JSON.stringify(error)}`);
      commonEventManager.publish('Sub_InputMethod_IME_createPanelCallback_static_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PrivateDateTransferred_static_0500(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let record: Record<string, inputMethodEngine.CommandDataType> = {
      'valueString1': 'abcdefg',
      'valueString2': true,
      'valueString3': 500,
      'valueString4': 'abcdefgg',
      'valueString5': true,
    }
    try {
      await this.InputClient!.sendPrivateCommand(record);
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500 sendPrivateCommond success`);
      commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', commonEventPublishData, this.publishCallback); 

    } catch (err) {
      err = err as BusinessError;
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0500 catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }
      commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PrivateDateTransferred_static_0600(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility!.onPrivateCommand(async (record: Record<string, inputMethodEngine.CommandDataType>): void => {
        console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 onPrivateCommand into`);
        inputMethodAbility!.offPrivateCommand();
      });
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 sendPrivateCommond success`);
    } catch (err) {
      err = err as BusinessError;
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0600 catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }      
    }
    commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PrivateDateTransferred_static_0700(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0700`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility!.onPrivateCommand(async (record: Record<string, inputMethodEngine.CommandDataType>): void => {
        console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0700 onPrivateCommand into`);
        inputMethodAbility!.offPrivateCommand((): void => {});
      });
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0700 sendPrivateCommond success`);
    } catch (err) {
      err = err as BusinessError;
      console.info(`${TAG} ====>Sub_InputMethod_IME_PrivateDateTransferred_static_0700 catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }      
    }
    commonEventManager.publish('Sub_InputMethod_IME_PrivateDateTransferred_static_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Custom_static_0900(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onMessage msgId: ${msgId}`);
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 onMessage msgIdSize: ${msgId.length}`);
          if (msgId === 'Sub_InputMethod_IME_Custom_static_0900') {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 start sendMessage`);
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0900', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0900', that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0900 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0900', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0200(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 onTerminated`);
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          let bufferString = that.GetArrayBufferString(msgParam as ArrayBuffer);
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 256 && msgParam?.byteLength === 131072) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 start sendMessage`);
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0200', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0200', that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0200 recvMessage err: ${JSON.stringify(error)}`);
    }
    commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Custom_static_0800(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 onTerminated`);
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 0 && msgParam?.byteLength === 131072) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 start sendMessage`);
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0800', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_0800', that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0800 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0800', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0400(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 onMessage msgIdSize: ${msgId.length}`);
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0400 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0400', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0300(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 onTerminated`);
        },
        onMessage(msgId: string): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 onMessage msgIdSize: ${msgId.length}`);
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0300 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0300', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_1100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 onTerminated`);
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 onMessage msgIdSize: ${msgId.length}`);
          if (msgId.length === 256 && msgParam?.byteLength === undefined) {
            console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 start sendMessage`);
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_1100', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient!.sendMessage('Sub_InputMethod_IME_Custom_static_1100', that.newArrayBuffer('FAILED'));
          }
          that.InputClient!.recvMessage();
        }
      };
      that.InputClient!.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_1100 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_1100', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0901(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMsgId';
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient!.sendMessage(msgId, msgParam);
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901 sendMessage success`);
    } catch (error) {
      if (error.code === 12800016) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0901 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0901', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Custom_static_0902(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMsgId';
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient!.sendMessage(msgId, msgParam);
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902 sendMessage success`);
    } catch (error) {
      if (error.code === 12800015) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====>Sub_InputMethod_IME_Custom_static_0902 recvMessage err: ${JSON.stringify(error)}`);
    }
    setTimeout(() => {
      commonEventManager.publish('Sub_InputMethod_IME_Custom_static_0902', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  // zhangyushuai
  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0050(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success');
    if (this.softKeyboardPanel !== null) {
      try {
        this.softKeyboardPanel!.setUiContent('pages/Second', (err, data) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent');
        if (err) {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 Succeed setUiContent: ' + JSON.stringify(data));
        };
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
       });
      } catch (error) {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 catch error: ' + JSON.stringify(error));
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
      }
    } else {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 this.softKeyboardPanel is null');
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
    };
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0060(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.setUiContent('pages/Second').then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 Succeed in setUiContent.' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 setUiContent error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0070(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.setUiContent('pages/Second', this.storage, (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent error: ' + JSON.stringify(err));
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + 'Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 Succeed setUiContent: ' + JSON.stringify(data));
          }
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
        })
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0080(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.setUiContent('pages/Second', this.storage).then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 Succeed in setUiContent: ' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 setUiContent error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizeCallback_0090(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.resize(this.windowWidth, this.windowHeight, (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize');
          if (err) {
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize error: ' + JSON.stringify(err));
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 Succeeded in changing the panel size: ' + JSON.stringify(data));
          }
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
        })
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizePromise_0100(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.resize(this.windowWidth, this.windowHeight).then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0100 Succeed in changing the panel size: ' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 resize error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToCallback_0110(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.moveTo(100, 100, (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo');
          if (err) {
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo error: ' + JSON.stringify(err));
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 Succeed in moving the panel: ' + JSON.stringify(data));
          };
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToPromise_0120(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.moveTo(100, 100).then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 Succeed in moving the panel: ' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 moveTo error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IME_Dragging_1100(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let fla_fixed = inputMethodEngine.PanelFlag.FLG_FIXED;
    let fla_floating = inputMethodEngine.PanelFlag.FLG_FLOATING;
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          this.softKeyboardPanel!.changeFlag(fla_fixed);
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 switch to fla_fixed');
          this.softKeyboardPanel!.startMoving();
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 startMoving success');
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 startMoving err' + JSON.stringify(err));
          if (err.code === 12800017) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
          if (err.code === 801) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
        } finally {
          this.softKeyboardPanel!.changeFlag(fla_floating);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 this.softKeyboardPanel is null');
      };
      commonEventManager.publish('Sub_InputMethod_IME_Dragging_1100', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IME_Dragging_1100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Dragging_0800(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let num = await this.softKeyboardPanel!.getDisplayId();
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 typeof num: ' + typeof(num));
          if (typeof(num) === 'number') {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 getDisplayId err' + JSON.stringify(err));
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 this.softKeyboardPanel is null');
      };
      commonEventManager.publish('Sub_InputMethod_IME_Dragging_0800', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IME_Dragging_0800', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Dragging_0900(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 success');
    try {
      let panelInfo: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
        flag: inputMethodEngine.PanelFlag.FLG_FLOATING
      };
      inputMethodAbility!.createPanel(this.mContext!, panelInfo).then(async(inputPanel: inputMethodEngine.Panel | null):void => {
        if (inputPanel) {
          let wid = Math.floor(this.displayInfo!.width * 0.4).toInt();
          let hei = Math.floor(this.displayInfo!.height * 0.5).toInt();
          console.info(TAG + `====>Sub_InputMethod_IME_Dragging_0900 wid: ${wid},hei: ${hei}`);
          await inputPanel.resize(wid, hei);
          let wid_ = Math.floor(this.displayInfo!.width * 0.3).toInt();
          let hei_ = Math.floor(this.displayInfo!.height * 0.4).toInt();
          console.info(TAG + `====>Sub_InputMethod_IME_Dragging_0900 wid_: ${wid_},hei_: ${hei_}`);
          await inputPanel.moveTo(wid_, hei_);
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 creat panel success!');
          let displayId = await inputPanel.getDisplayId();
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 getDisplayId success!');
          if (typeof displayId === 'long') {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          commonEventPublishData = {
            data: typeof displayId
          };
        };
        await inputMethodAbility!.destroyPanel(inputPanel!);
        commonEventManager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
      }).catch((err) => {
        console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 creat panel throw err: ' + JSON.stringify(err));
        commonEventManager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
    }
  }
  
  private async Sub_InputMethod_IME_OffsetArea_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let fla_fixed = inputMethodEngine.PanelFlag.FLG_FIXED;
      let displayId = await this.softKeyboardPanel!.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      this.softKeyboardPanel!.changeFlag(fla_fixed);
      console.info(TAG + '====>Sub_InputMethod_IME_OffsetArea_0100 changeFlag  success ');
      let SystemPanelInsets = await this.softKeyboardPanel!.getSystemPanelCurrentInsets(displayId);
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_0100 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets!.left}, right:  ${SystemPanelInsets!.right}, bottom:  ${SystemPanelInsets!.bottom}}`);
      if (typeof(SystemPanelInsets!.left) === 'number' && typeof(SystemPanelInsets!.right) === 'number' && typeof(SystemPanelInsets!.bottom) === 'number') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_0100 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    } finally {
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_0100 getSystemPanelCurrentInsets end`);
      commonEventManager.publish('Sub_InputMethod_IME_OffsetArea_0100', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_OffsetArea_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let SystemPanelInsets = await this.softKeyboardPanel!.getSystemPanelCurrentInsets(1008611);
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1200 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets!.left}, right:  ${SystemPanelInsets!.right}, bottom:  ${SystemPanelInsets!.bottom}}`);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1200 cathch err.code: ${err.code}  , err.message: ${err.message}`);
      if (err.code === 12800022) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    } finally {
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1200 getSystemPanelCurrentInsets end`);
      commonEventManager.publish('Sub_InputMethod_IME_OffsetArea_1200', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_OffsetArea_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1000 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        await inputMethodAbility!.destroyPanel(this.softKeyboardPanel!);
      } else {
        console.info(TAG + '====>Sub_InputMethod_IME_OffsetArea_1000 this.softKeyboardPanel is null');
      };
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
        flag: inputMethodEngine.PanelFlag.FLAG_CANDIDATE
      };
      let inputPanel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 createPanel success`);
      let displayId = await inputPanel.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      try {
        let SystemPanelInsets = await inputPanel.getSystemPanelCurrentInsets(displayId);
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets!.left}, right:  ${SystemPanelInsets!.right}, bottom:  ${SystemPanelInsets!.bottom}}`);
      } catch (err) {
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets cathch err.code: ${err.code}  , err.message: ${err.message}`);
        if (err.code === 12800017) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      } finally {
        await inputMethodAbility!.destroyPanel(inputPanel);
        console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets end`);
      };
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_OffsetArea_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_OffsetArea_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 createPanel success`);
      let displayId = await inputPanel.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      try {
        let SystemPanelInsets = await inputPanel.getSystemPanelCurrentInsets(displayId);
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets!.left}, right:  ${SystemPanelInsets!.right}, bottom:  ${SystemPanelInsets!.bottom}}`);
      } catch (err) {
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets cathch err.code: ${err.code}  , err.message: ${err.message}`);
        if (err.code === 12800017) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      } finally {
        await inputMethodAbility!.destroyPanel(inputPanel);
        console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets end`);
      };
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_OffsetArea_1100', commonEventPublishData, this.publishCallback);
  }

  private Sub_Misc_inputMethod_Panel_showCallback_0130(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.show((err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show');
          if (err) {
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show error: ' + JSON.stringify(err));
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_showCallback_0130 Succeed in showing the panel: ' + JSON.stringify(data));
          };
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_showPromise_0140(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.show().then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_showPromise_0140 Succeed in showing the panel: ' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 show error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_hideCallback_0150(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.hide((err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide');
          if (err) {
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide error: ' + JSON.stringify(err));
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_hideCallback_0150 Succeed in hiding the panel: ' + JSON.stringify(data));
          };
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_hidePromise_0160(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.hide().then((data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_hidePromise_0160 Succeed in hiding the panel: ' + JSON.stringify(data));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
        }).catch((err) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 hide error: ' + JSON.stringify(err));
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
        });
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onShow_0170(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onShow(() => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel!.offShow(()=>{});
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 onShow error: ');
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onShow_0170 Succeed onShow: ');
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
        });
        await this.softKeyboardPanel!.show();
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 this.softKeyboardPanel is null');
        commonEventManager.publish('ub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onHide_0180(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onHide(() => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 onHide');
          this.softKeyboardPanel!.offHide(()=>{});
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onHide_0180 Succeed onHide:');
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
        });
        await this.softKeyboardPanel!.hide();
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_offShow_0190(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onShow(() => {
          this.softKeyboardPanel!.offShow();
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 off Show count: ' + count);
        });
        setInterval(async (t1: int):void => {
          await this.softKeyboardPanel!.show();
          await this.softKeyboardPanel!.hide();
          timeCount += 1;
          console.info(TAG + '====>this.softKeyboardPanel.show setInterval timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(t1);
          }
        }, 100);

        setTimeout((t2: int) => {
          console.info(TAG + '====>setTimeout count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
          clearTimeout(t2);
        }, 500);

      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_offHide_0200(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onHide(() => {
          this.softKeyboardPanel!.offHide();
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 off hide count: ' + count);
        });

        setInterval(async (t1: int) => {
          await this.softKeyboardPanel!.show();
          await this.softKeyboardPanel!.hide();
          timeCount += 1;
          console.info(TAG + '====>this.softKeyboardPanel.hide setInterval timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(t1);
          }
        }, 300);

        setTimeout((t2: int) => {
          console.info(TAG + '====>setTimeout count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
          clearTimeout(t2);
        }, 1000);

      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodEngine_test_049(): Promise<void> {
    console.info(TAG + '====>receive inputMethodEngine_test_049 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.keyboardController!.hide((err, value) => {
        if (err) {
          console.info(TAG + '====>inputMethodEngine_test_049 hide:' + JSON.stringify(err));
        } else {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        commonEventManager.publish('inputMethodEngine_test_049', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>inputMethodEngine_test_049 hide throw_err:');
      commonEventManager.publish('inputMethodEngine_test_040', commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodEngine_test_050(): Promise<void> {
    console.info(TAG + '====>receive inputMethodEngine_test_050 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.keyboardController!.hide();
      console.info(TAG + '====>inputMethodEngine_test_050 hideKeyboard success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>inputMethodEngine_test_050 hideKeyboard catch err:');
    }
    commonEventManager.publish('inputMethodEngine_test_050', commonEventPublishData, this.publishCallback);
  }

  async inputMethodEngine_test_072(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_072 success');
    let count = 0;
    inputKeyboardDelegate!.onKeyDown((keyEvent) => {
      inputKeyboardDelegate!.offKeyDown((keyEvent) => {
        console.info(TAG + '====>inputKeyboardDelegate.off("keyDown") count: ' + count);
        return true;
      });
      console.info(TAG + '====>inputKeyboardDelegate.on("keyDown") count: ' + count);
      console.info(TAG + '====>inputKeyboardDelegate.keyEvent.keyAction ' + keyEvent.keyAction);
      if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 2) {
        count += 1;
      }
      return true;
    });
    inputKeyboardDelegate!.onKeyUp((keyEvent) => {
      inputKeyboardDelegate!.offKeyUp((keyEvent) => {
        console.info(TAG + '====>inputKeyboardDelegate.off("keyUp") count: ' + count);
        return true;
      });
      console.info(TAG + '====>inputKeyboardDelegate.on("keyUp") count: ' + count);
      console.info(TAG + '====>inputKeyboardDelegate.keyEvent.keyAction ' + keyEvent.keyAction);
      if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 3) {
        count += 1;
      }
      return true;
    });
    setTimeout((t: int) => {
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      commonEventManager.publish('inputMethodEngine_test_072', commonEventPublishData, this.publishCallback);
      clearTimeout(t);
    }, 1000);
  }

  async inputMethodEngine_test_073(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_073 success');
    let count = 0;
    inputKeyboardDelegate!.onKeyDown((keyEvent) => {
      inputKeyboardDelegate!.offKeyDown();
      console.info(TAG + '====>inputKeyboardDelegate.on("keyDown") count: ' + count);
      console.info(TAG + '====>inputKeyboardDelegate.keyEvent.keyAction ' + keyEvent.keyAction);
      if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 2) {
        count += 1;
      }
      return true;
    });
    inputKeyboardDelegate!.onKeyUp((keyEvent) => {
      inputKeyboardDelegate!.offKeyUp();
      console.info(TAG + '====>inputKeyboardDelegate.on("keyUp") count: ' + count);
      console.info(TAG + '====>inputKeyboardDelegate.keyEvent.keyAction ' + keyEvent.keyAction);
      if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 3) {
        count += 1;
      }
      return true;
    });
    setTimeout((t: int) => {
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      commonEventManager.publish('inputMethodEngine_test_073', commonEventPublishData, this.publishCallback);
      clearTimeout(t);
    }, 1000);
  }

  async inputMethodEngine_test_074(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_074 success');
    let count = 0;

    setTimeout((t: int) => {
      clearTimeout(t);
      inputKeyboardDelegate!.onCursorContextChange((x, y, h) => {
        console.info(TAG + '====>inputKeyboardDelegate.on("cursorContextChange") count: ' + count);
        if (count === 1) {
          inputKeyboardDelegate!.offCursorContextChange();
          console.info(TAG + '====>inputMethodEngine_test_074 inputKeyboardDelegate.off');
        }
        count += 1;
        console.info(TAG + '====>inputMethodEngine_test_074 x,y,z: ' + x + '---' + y + '---' + h);
      });

      let loop = 0;
      setInterval(async (t1: int) => {
        await this.InputClient!.insertText('ttt');
        console.info(TAG + '====>keyboardController.insertText count: ' + count);
        console.info(TAG + '====>keyboardController.insertText loop: ' + loop);
        loop += 1;
        if (loop === 3) {
          clearInterval(t1);
        }
      }, 500);
    }, 1000);

    setTimeout((t1: int) => {
      if (count === 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodEngine_test_074', commonEventPublishData, this.publishCallback);
      clearTimeout(t1);
    }, 4000);
  }

  async inputMethodEngine_test_075(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_075 success');
    let count = 0;

    setTimeout((t: int) => {
      clearTimeout(t);
      inputKeyboardDelegate!.onCursorContextChange((x, y, h) => {
        console.info(TAG + '====>inputKeyboardDelegate.on("cursorContextChange") count: ' + count);
        if (count === 1) {
          inputKeyboardDelegate!.offCursorContextChange((): void => {});
          console.info(TAG + '====>inputMethodEngine_test_075 inputKeyboardDelegate.off');
        }
        count += 1;
        console.info(TAG + '====>inputMethodEngine_test_075 x,y,z: ' + x + '---' + y + '---' + h);
      });

      let loop = 0;
      setInterval(async (t1: int) => {
        await this.InputClient!.insertText('ttt');
        console.info(TAG + '====>keyboardController.insertText count: ' + count);
        console.info(TAG + '====>keyboardController.insertText loop: ' + loop);
        loop += 1;
        if (loop === 3) {
          clearInterval(t1);
        }
      }, 500);
    }, 1000);

    setTimeout((t1: int) => {
      if (count === 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodEngine_test_075', commonEventPublishData, this.publishCallback);
      clearTimeout(t1);
    }, 4000);
  }

  async inputMethodEngine_test_076(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    await this.InputClient!.moveCursor(inputMethodEngine.CURSOR_LEFT);
    console.info(TAG + '====>receive inputMethodEngine_test_076 success');
    inputKeyboardDelegate!.onSelectionChange((oldBegin, oldEnd, newBegin, newEnd) => {
      console.info(TAG + '====>inputKeyboardDelegate.on("selectionChange")');
      inputKeyboardDelegate!.offSelectionChange();
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>inputMethodEngine_test_076 oldBegin,oldEnd,newBegin,newEnd: ' + oldBegin + '---' +
        oldEnd + '---' + newBegin + '---' + newEnd);
    });

    setTimeout((t: int) => {
      commonEventManager.publish('inputMethodEngine_test_076', commonEventPublishData, this.publishCallback);
      clearTimeout(t);
    }, 2000);
  }

  async inputMethodEngine_test_077(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_077 success');
    let count = 0;
    inputKeyboardDelegate!.onTextChange((text) => {
      console.info(TAG + '====>inputKeyboardDelegate.on("textChange") count:' + count);
      if (count === 1) {
        inputKeyboardDelegate!.offTextChange();
      }
      count += 1;
      console.info(TAG + '====>inputMethodEngine_test_077 text: ' + text);
    });

    let loopCount = 0;
    setInterval(async (t: int):void => {
      await this.InputClient!.insertText('tttt');
      console.info(TAG + '====>keyboardController.insertText count: ' + count);
      if (loopCount === 2) {
        clearInterval(t);
      }
      loopCount += 1;
    }, 300);

    setTimeout((t1: int) => {
      if (count === 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodEngine_test_077', commonEventPublishData, this.publishCallback);
      clearTimeout(t1);
    }, 2000);
  }

  async inputMethodEngine_test_078(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    await this.InputClient!.moveCursor(inputMethodEngine.CURSOR_LEFT);
    console.info(TAG + '====>receive inputMethodEngine_test_078 success');
    inputKeyboardDelegate!.onSelectionChange((oldBegin, oldEnd, newBegin, newEnd) => {
      console.info(TAG + '====>inputKeyboardDelegate.on("selectionChange")');
      inputKeyboardDelegate!.offSelectionChange((): void => {});
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>inputMethodEngine_test_078 oldBegin,oldEnd,newBegin,newEnd: ' + oldBegin + '---' +
        oldEnd + '---' + newBegin + '---' + newEnd);
    });

    setTimeout((t: int) => {
      commonEventManager.publish('inputMethodEngine_test_078', commonEventPublishData, this.publishCallback);
      clearTimeout(t);
    }, 2000);
  }

  async inputMethodEngine_test_079(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodEngine_test_079 success');
    let count = 0;
    inputKeyboardDelegate!.onTextChange((text) => {
      console.info(TAG + '====>inputKeyboardDelegate.on("textChange") count:' + count);
      if (count === 1) {
        inputKeyboardDelegate!.offTextChange((): void => {});
      }
      count += 1;
      console.info(TAG + '====>inputMethodEngine_test_079 text: ' + text);
    });

    let loopCount = 0;
    setInterval(async (t: int):void => {
      await this.InputClient!.insertText('tttt');
      console.info(TAG + '====>keyboardController.insertText count: ' + count);
      if (loopCount === 2) {
        clearInterval(t);
      }
      loopCount += 1;
    }, 300);

    setTimeout((t1: int) => {
      if (count === 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodEngine_test_079', commonEventPublishData, this.publishCallback);
      clearTimeout(t1);
    }, 2000);
  }

  private Sub_Misc_inputMethod_Panel_changeFlag_0210(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          this.softKeyboardPanel!.changeFlag(inputMethodEngine.PanelFlag.FLG_FLOATING);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
        } catch (err) {
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0210 throw_error: ' + err);
        }

      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_changeFlag_0211(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let fla_fixed = inputMethodEngine.PanelFlag.FLG_FIXED;
          let fla_floating = inputMethodEngine.PanelFlag.FLG_FLOATING;
          this.softKeyboardPanel!.changeFlag(fla_fixed);
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 switch to fla_fixed');
          this.softKeyboardPanel!.changeFlag(fla_floating);
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 switch to fla_floating');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 throw_error: ' + err);
        };
      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 this.softKeyboardPanel is null');
      };
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_FullScreenUR_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.changeFlag(inputMethodEngine.PanelFlag.FLAG_CANDIDATE)
      this.softKeyboardPanel!.updateRegion([{ left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}]);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 cathch err: ' + JSON.stringify(err));
      if (err.code === 12800017) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        this.softKeyboardPanel!.changeFlag(inputMethodEngine.PanelFlag.FLG_FIXED);
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenUR_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.updateRegion([]);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0300 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0300 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0300 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenUR_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0400 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try{
      this.softKeyboardPanel!.updateRegion([{ left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}, { left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}, { left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}, { left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}, { left: 320, top: 650, width: this.displayInfo!.width.toInt(), height: 500}]);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0400 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0400 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0400 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenUR_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1:inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel =  await inputMethodAbility!.createPanel(this.mContext!,panelInfo1);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 creatPanel Succeed.');
      try{
        inputPanel.updateRegion([{ left: (this.displayInfo!.width*0.3).toInt(), top: (this.displayInfo!.height * 0.5).toInt(), width: this.displayInfo!.width.toInt(), height: (this.displayInfo!.height * 0.5).toInt()}]);
      } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 cathch err: ' + err);
        if (err.code === 12800017) {
          console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 Failed to adjustPanelRect err is ' + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          await inputMethodAbility!.destroyPanel(inputPanel);
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 cathch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenUR_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0700 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.updateRegion([{ left: -1, top: -1, width: this.displayInfo!.width.toInt() + 3000, height: this.displayInfo!.height.toInt() + 3000}]);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0700 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0700 cathch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenUR_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IMF_SecurityKeyboard_0601(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0601 success');
    let panelInfo1:inputMethodEngine.PanelInfo = {
      type:  inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag:  inputMethodEngine.PanelFlag.FLG_FIXED
    };
    let inputPanel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);
    try {
      let isPrivacyMode: boolean = true;
      inputPanel.setPrivacyMode(isPrivacyMode);
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0601 setPrivacyMode success');
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0601', commonEventPublishData, this.publishCallback);
    } catch (error) {
      if (error.code === 201) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      await inputMethodAbility!.destroyPanel(inputPanel);
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0601 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0601', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_0600(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = true;
          this.softKeyboardPanel!.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 Failed to set privacy mode' + err);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 this.softKeyboardPanel is null');
      }
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_0700(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = false;
          this.softKeyboardPanel!.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 Failed to set privacy mode' + err);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 this.softKeyboardPanel is null');
      };
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
    }
  }

  // zhangpa
  private async Sub_InputMethod_IME_PaneladjustPanelRect_0100(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(), height: (this.displayInfo!.height * 0.4).toInt()},
        portraitRect: {left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(), height: this.displayInfo!.width.toInt()}
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(`${TAG} ====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 success`);
      commonEventManager.publish('Sub_InputMethod_IME_PaneladjustPanelRect_0100', commonEventPublishData, this.publishCallback)
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(`${TAG} ====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 catch err.code: ${err.code}, error message: ${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_PaneladjustPanelRect_0100', commonEventPublishData, this.publishCallback);
    };
  }
 	 
  private async Sub_InputMethod_IME_ScreenRotation_0100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(), height: (this.displayInfo!.height * 0.4).toInt()},
        portraitRect: {left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(), height: this.displayInfo!.width.toInt()}
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0100 startAbility success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0100 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_ScreenRotation_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_ScreenRotation_0200(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0200 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.displayInfo!.width.toInt(), height: (this.displayInfo!.height * 0.4).toInt()},
        portraitRect: {left: 100, top: 100, width: (this.displayInfo!.height * 0.4).toInt(), height: this.displayInfo!.width.toInt()}
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0200 startAbility success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_ScreenRotation_0200 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_ScreenRotation_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 0, width: this.displayInfo!.width.toInt(), height: (this.displayInfo!.height * 0.5).toInt()},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1960,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0100  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0100 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0100 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0200(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0200 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 0, width: this.displayInfo!.height.toInt(), height: (this.displayInfo!.width * 0.5).toInt()},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0200  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0200 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0200 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0500(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0500 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 3000, width: this.displayInfo!.height.toInt() + 2000, height: this.displayInfo!.width.toInt() + 2000},
        portraitRect: { left: 0, top: 3000, width: this.displayInfo!.width.toInt() + 2000, height: this.displayInfo!.height.toInt() + 2000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0500  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0500 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0500 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0400(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0400 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0400  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0400 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0400 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0300(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0300 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 800, width: 300, height: 800},
        landscapeAvoidY: 500,
        landscapeInputRegion:[],
        portraitAvoidY: 1950,
        portraitInputRegion:[],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0300  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0300 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0300 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_1200(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1200 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1200  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1200 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 12800017) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1200 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0700(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: this.displayInfo!.width.toInt()},
        portraitRect: { left: 0, top: 1500, width: 300, height: this.displayInfo!.height.toInt()},
        landscapeAvoidY: 20,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 20,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0600(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 2100},
        landscapeAvoidY: 20,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 20,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0700 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0800(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0800 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: -1,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}],
        portraitAvoidY: -1,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}],
        fullScreenMode: true
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0800  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0800 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0800 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0800', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0900(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0900 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: -1,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}],
        portraitAvoidY: -1,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0900  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0900 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_0900 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0900', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_1000(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1000 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}, { left: 0, top: 247, width: this.displayInfo!.height.toInt(), height: 150}],
        portraitAvoidY: 1200,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}, { left: 0, top: 1695, width: this.displayInfo!.width.toInt(), height: 150}],
        fullScreenMode: false
      };
      this.softKeyboardPanel!.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);

      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1000  success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1000 catch err.code: ${err.code}, error message: ${err.message}`);
      if (err.code === 401) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1000 failed to adjustPanelRect err is ` + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_1100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      }
      let inputpanel: inputMethodEngine.Panel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100  Succeed`);
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.displayInfo!.height.toInt(), height: 600}],
        portraitAvoidY: 500,
        portraitInputRegion:[{ left: 0, top: 1960, width: this.displayInfo!.width.toInt(), height: 760}],
        fullScreenMode: true
      };
      try {
        inputpanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);
      } catch(err) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100 catch err.code: ${err.code}, error message: ${err.message}`);
        if (err.code === 12800017) {
          console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100 failed to adjustPanelRect err is ` + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          await inputMethodAbility!.destroyPanel(inputpanel);
        }
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100 success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_FullScreenAbnormal_1100 catch err.code: ${err.code}, error message: ${err.message}`);
    }
    commonEventManager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_0900(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0900 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE);
      let mode = this.softKeyboardPanel!.getImmersiveMode();
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0900 ImmersiveMode : ` + JSON.stringify(mode));
      if (mode == 0) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0900 success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0900 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_Immersive_0900', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1000(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1000 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let mode = this.softKeyboardPanel!.getImmersiveMode();
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1000 ImmersiveMode : ` + JSON.stringify(mode));
      if (mode == 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1000 success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1000 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_Immersive_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1100(): Promise<void> {
    console.info(`${TAG} ====>resieve Sub_InputMethod_IME_Immersive_1100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.DARK_IMMERSIVE);
      let mode = this.softKeyboardPanel!.getImmersiveMode();
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1100 ImmersiveMode : ` + JSON.stringify(mode));
      if (mode == 3) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1100 success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1100 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_Immersive_1100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1200(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_Immersive_1200 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    inputKeyboardDelegate!.onEditorAttributeChanged((attr: inputMethodEngine.EditorAttribute) => {
      console.info(`${TAG} ====>on_EditorAttribute_callback = ${JSON.stringify(attr)} immersiveMode = ${attr.immersiveMode} gradientMode = ${attr.gradientMode}`);
      this.immersive = attr.immersiveMode as inputMethodEngine.ImmersiveMode;
      inputKeyboardDelegate!.offEditorAttributeChanged();
    });
    try {
      setTimeout(() => {
        let mode = inputMethodEngine.ImmersiveMode.fromValue(this.immersive);
        console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1200 ImmersiveMode : ` + JSON.stringify(mode));
        if (mode == 2) {
          commonEventPublishData = {
            data: 'SUCCESS'
          }
        };
        console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1200 success`);
        commonEventManager.publish('Sub_InputMethod_IME_Immersive_1200', commonEventPublishData, this.publishCallback);
      }, 500)
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_1200 catch err.code: ${err.code}, error message: ${err.message}`);
      commonEventManager.publish('Sub_InputMethod_IME_Immersive_1200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Immersive_0500(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_Immersive_0500 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      try{
        this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.IMMERSIVE);
      } catch(err) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0500 setImmersiveMode err.code: ${err.code}, error message: ${err.message}`);
        if (err.code === 401) {
          console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0500 setImmersiveMode err: ` + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0500 success`);
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0500 catch err.code: ${err.code}, error message: ${err.message}`);
    }
    commonEventManager.publish('Sub_InputMethod_IME_Immersive_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_0600(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_Immersive_0600 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      }
      let inputpanel: inputMethodEngine.Panel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);

      try{
        inputpanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
        let effect: inputMethodEngine.ImmersiveEffect = {
          gradientHeight: 1,
          gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
          fluidLightMode: inputMethodEngine.FluidLightMode.NONE
        }
        inputpanel.setImmersiveEffect(effect);
        console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0600 setImmersiveMode success `);
      } catch(err) {
        console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0600 setImmersiveMode err.code: ` + err.code + JSON.stringify(err));
        await inputMethodAbility!.destroyPanel(inputpanel);
        if (err.code === 801) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        if (err.code === 12800021) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      };
    } catch (err) {
      console.info(`${TAG} ====>Sub_InputMethod_IME_Immersive_0600 catch err.code: ${err.code}, error message: ${err.message}`);
    }
    commonEventManager.publish('Sub_InputMethod_IME_Immersive_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.STATUS_BAR,
      flag: inputMethodEngine.PanelFlag.FLG_FIXED
    };
    console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 success`);
    try {
      inputMethodAbility!.createPanel(this.mContext!, panelInfo1)
        .then((panel: inputMethodEngine.Panel) => {
          inputMethodAbility!.destroyPanel(panel, (err) => {
            if (err) {
              console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 err ${err?.code}`);
            } else {
              commonEventPublishData = {
                data: 'SUCCESS'
              };
              console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 destroyPanel success `);
            }
            commonEventManager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030', commonEventPublishData, this.publishCallback);
          })
        }).catch((err)=>{
          console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 crete panel err: ${err.code}`);
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030', commonEventPublishData, this.publishCallback);
        })
    } catch (err) {
      console.info(`${TAG} ====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030 catch err: ${err.code}`);
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_static_0030', commonEventPublishData, this.publishCallback);
    }
  }

  public inputMethodAbility_test_static_091(): void {
    console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 start`);
      inputMethodAbility!.onInputStop(() => {
        console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 onInputStop success`);
      })
      inputMethodAbility!.offInputStop(() => {
        console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 offInputStop success`);
      });
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 end`);
      commonEventManager.publish('inputMethodAbility_test_static_091', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(`${TAG} ====>receive inputMethodAbility_test_static_091 err: ${err.code}`);
      commonEventManager.publish('inputMethodAbility_test_static_091', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0100(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_setImmersiveEffect_0100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try{
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      }
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0100 ImmersiveMode ` + JSON.stringify(effect));
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0100 SUCCESS`);
    } catch(err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0100 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_setImmersiveEffect_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0200(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_setImmersiveEffect_0100 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try{
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 1,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      }
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0200 ImmersiveMode ` + JSON.stringify(effect));
    } catch(err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      if (err.code === 12800020) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0200 catch err` + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_setImmersiveEffect_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0300(): Promise<void> {
    console.info(`${TAG} ====>receive Sub_InputMethod_IME_setImmersiveEffect_0300 data`);
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try{
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      }
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0300 ImmersiveMode ` + JSON.stringify(effect));
    } catch(err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      if (err.code === 12800020) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0300 catch err` + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_setImmersiveEffect_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0400 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.BACKGROUND_FLUID_LIGHT
      };
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0400 effect :' + JSON.stringify(effect));
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      if (err.code === 202) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0400 cathch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_setImmersiveEffect_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0500 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 1,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      };
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0500 effect :' + JSON.stringify(effect));
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0500 success ');
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(`${TAG} ====>Sub_InputMethod_IME_setImmersiveEffect_0500 catch err.code: ${err.code}, error message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_setImmersiveEffect_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.BACKGROUND_FLUID_LIGHT
      };
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0300 effect :' + JSON.stringify(effect));
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      if (err.code === 12800020) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0300 cathch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_Streamer_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_0500 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT
      };
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0500 ImmersiveMode :' + JSON.stringify(effect));
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0500 success ');
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0500 catch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_Streamer_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_1000 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let Height = (this.displayInfo!.height > this.displayInfo!.width ? this.displayInfo!.height : this.displayInfo!.width) * 0.15 + 1;
      this.softKeyboardPanel!.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: Height.toInt(),
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT
      };
      this.softKeyboardPanel!.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_1000 effect :' + JSON.stringify(effect));
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_1000 cathch err: ' + JSON.stringify(err));
    };
    commonEventManager.publish('Sub_InputMethod_IME_Streamer_1000', commonEventPublishData, this.publishCallback);
  }  

  private async Sub_InputMethod_IME_setKeepScreenOn_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setKeepScreenOn_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.STATUS_BAR,
    };
    let inputPanel: inputMethodEngine.Panel = await inputMethodAbility!.createPanel(this.mContext!, panelInfo1);
    try {
      let isKeepScreenOn = true;
      await inputPanel.setKeepScreenOn(isKeepScreenOn);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0100 cathch err: ' + JSON.stringify(err));
    } finally {
      await inputMethodAbility!.destroyPanel(inputPanel);
    };
    commonEventManager.publish('Sub_InputMethod_IME_setKeepScreenOn_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel!.setSystemPanelButtonColor('#01000000', '#01000000');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0100 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0100 cathch err.code: ${err.code} err.message: ${err.message}`);
    };
    commonEventManager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0100', commonEventPublishData, this.publishCallback);
  }

  private SUB_Misc_InputMethod_Manage_Physical_Buttons_0020(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 success');
    inputKeyboardDelegate!.onKeyEvent((KeyEvents) => {
      inputKeyboardDelegate!.offKeyEvent();
      console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
      try {
        console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyEvent: " + KeyEvents.action);
        console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyEvent: " + KeyEvents.key.code);
        if (KeyEvents.key.code === 2017 && KeyEvents.action === 1) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        } else {
          commonEventPublishData = {
            data: "FAILED"
          };
        }
      } catch (err) {
        console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyDown throw_error: " + err);
      }
      return true;
    });
    setTimeout(() => {
      commonEventManager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0020", commonEventPublishData,
        this.publishCallback);
    }, 800);
  }

  private async Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    inputKeyboardDelegate!.onEditorAttributeChanged((attr:inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)}`);
      if (typeof (attr!.enterKeyType) === 'int' && typeof (attr!.inputPattern) === 'int' &&
         typeof (attr!.isTextPreviewSupported) === 'boolean' && typeof (attr!.windowId) === 'int' &&
 	       typeof (attr!.placeholder) === 'string' && typeof (attr!.immersiveMode) === 'int' &&
 	       typeof (attr!.gradientMode) === 'int' && typeof (attr!.extraConfig) === 'object' &&
 	       typeof (attr!.capitalizeMode) === 'int' && typeof (attr!.bundleName) === 'string' &&
 	       typeof (attr!.displayId) === 'long' && typeof (attr!.abilityName) === 'string') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      inputKeyboardDelegate!.offEditorAttributeChanged((): void => {});
      commonEventManager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100', commonEventPublishData, this.publishCallback);
    });
    try {
      let callingDisplayDidChangeCallback = (num: int): void => {
        console.info(TAG + `====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 display id: ${num}`);
      };
      inputMethodAbility!.onCallingDisplayDidChange(callingDisplayDidChangeCallback);
      inputMethodAbility!.offCallingDisplayDidChange(callingDisplayDidChangeCallback);
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 cathch err: ' + JSON.stringify(err));
      commonEventManager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    inputKeyboardDelegate!.onEditorAttributeChanged((attr:inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)}`);
      if (typeof (attr.windowId) === 'int' && typeof (attr.displayId) === 'long') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      inputKeyboardDelegate!.offEditorAttributeChanged();
      commonEventManager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200', commonEventPublishData, this.publishCallback);
    });
    try {
      let callingDisplayDidChangeCallback = (num: int): void => {
        console.info(TAG + `====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 display id: ${num}`);
      };
      inputMethodAbility!.onCallingDisplayDidChange(callingDisplayDidChangeCallback);
      inputMethodAbility!.offCallingDisplayDidChange();
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 cathch err: ' + JSON.stringify(err));
      commonEventManager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200', commonEventPublishData, this.publishCallback);
    }
  }

  // hehaitao
  private inputMethodEngine_test_getKeyboardDelegate_static_0100(): void {
    console.info(`${TAG} ====>inputMethodEngine_test_getKeyboardDelegate_static_0100 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    if (typeof(inputKeyboardDelegate) === 'object') {
      console.info(`${TAG} ====> receive inputMethodEngine_test_getKeyboardDelegate_static_0100 object`); 
      commonEventPublishData = {
        data: 'SUCCESS'
      }
    } else {
      console.info(`${TAG} ====> receive inputMethodEngine_test_getKeyboardDelegate_static_0100 failed`); 
    };
    commonEventManager.publish('inputMethodEngine_test_getKeyboardDelegate_static_0100', commonEventPublishData, this.publishCallback);
  }

  async inputMethodEngine_test_exitCurrentInputType_static_0100(): Promise<void> {
    console.info(`${TAG} ====>inputMethodEngine_test_exitCurrentInputType_static_0100 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      console.info(`${TAG} ====>inputMethodEngine_test_exitCurrentInputType_static_0100 exitCurrentInputType start`); 
      await this.keyboardController!!.exitCurrentInputType();
      console.info(`${TAG} ====>inputMethodEngine_test_exitCurrentInputType_static_0100 exitCurrentInputType success`); 
    } catch (err) {
      console.info(`${TAG} ====>inputMethodEngine_test_exitCurrentInputType_static_0100 exitCurrentInputType catch err: ${JSON.stringify(err)}`);
      if (err.code === 12800010) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      }
    }
    commonEventManager.publish('inputMethodEngine_test_exitCurrentInputType_static_0100', commonEventPublishData, this.publishCallback);
  }

  private inputMethodAbility_test_getSecurityMode_static_0100(): void {
    console.info(`${TAG} ====>inputMethodAbility_test_getSecurityMode_static_0100 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let mode1: inputMethodEngine.SecurityMode = inputMethodAbility!.getSecurityMode();
      if (mode1 === inputMethodEngine.SecurityMode.BASIC || mode1 === inputMethodEngine.SecurityMode.FULL) {
        console.info(`${TAG} ====>inputMethodAbility_test_getSecurityMode_static_0100 SecurityMode: ${mode1}`); 
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      }
      console.info(`${TAG} ====>inputMethodAbility_test_getSecurityMode_static_0100 exitCurrentInputType success`); 
      commonEventManager.publish('inputMethodAbility_test_getSecurityMode_static_0100', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(`${TAG} ====>inputMethodAbility_test_getSecurityMode_static_0100 exitCurrentInputType catch err: ${JSON.stringify(err)}`);
      commonEventManager.publish('inputMethodAbility_test_getSecurityMode_static_0100', commonEventPublishData, this.publishCallback);
    }    
  }

  async Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100(): Promise<void> {
    console.info(`${TAG} ====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.sendKeyFunction(1).then((result: boolean) => {
        if (result) {
          console.info(`${TAG} ====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100 success in key function`); 
          commonEventPublishData = {
            data: 'SUCCESS'
          }
        }
        commonEventManager.publish('Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100', commonEventPublishData, this.publishCallback);
      }).catch((err) => {
        console.info(`${TAG} ====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100 catch err`); 
        commonEventManager.publish('Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100', commonEventPublishData, this.publishCallback);
      })
    } catch (err) {
      console.info(`${TAG} ====>inputMethodAbility_test_getSecurity_static_0100 exitCurrentInputType catch err: ${JSON.stringify(err)}`);
      commonEventManager.publish('Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_static_0100', commonEventPublishData, this.publishCallback);
    }    
  }

  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100(): Promise<void> {
    console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 data`);     
    try {
      inputMethodAbility!.onInputStart((KeyboardDelegate: inputMethodEngine.KeyboardController, InputClient: inputMethodEngine.InputClient): void => {
        console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 inputStart`); 
        inputMethodAbility!.offInputStart((): void => {});
        if(InputClient == null) {
          console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 InputClient is null`); 
        } else {
          setTimeout(async (): void => {
            InputClient.sendKeyFunction(0).then((result: boolean) => {
              if(result){
                console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 InputClient success in key function`); 
              }else{
                console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 InputClient Failed in key function`); 
              }
            }).catch((err) => {
              console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100  catch err: ${err.code}`);
            })
          }, 500);
        }
      })
    } catch (err) {
      console.info(`${TAG} ====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_static_0100 try catch err: ${err.code}`);
    }
  } 

  async inputMethodEngine_test_static_029(): Promise<void> {
    console.info(TAG + '====>receive inputMethodEngine_test_static_029 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let editorAttribute = await this.InputClient!.getEditorAttribute();
    console.info(TAG + '====>receive inputMethodEngine_test_static_029 editorAttribute' + JSON.stringify(editorAttribute));
    let value: boolean = false;
    if(typeof (editorAttribute!.enterKeyType) === 'int' && typeof (editorAttribute!.inputPattern) === 'int' &&
         typeof (editorAttribute!.isTextPreviewSupported) === 'boolean' && typeof (editorAttribute!.windowId) === 'int' &&
 	       typeof (editorAttribute!.placeholder) === 'string' && typeof (editorAttribute!.immersiveMode) === 'int' &&
 	       typeof (editorAttribute!.gradientMode) === 'int' && typeof (editorAttribute!.extraConfig) === 'object' &&
 	       typeof (editorAttribute!.capitalizeMode) === 'int' && typeof (editorAttribute!.bundleName) === 'string' &&
 	       typeof (editorAttribute!.displayId) === 'long' && typeof (editorAttribute!.abilityName) === 'string'){
      let a:int = editorAttribute?.inputPattern as int;
      value = await this.InputClient!.sendKeyFunction(a);
    }
    console.info(TAG + '====>receive inputMethodEngine_test_static_029 sendKeyFunction' + JSON.stringify(value));
    if(value) {
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    }
    commonEventManager.publish('inputMethodEngine_test_static_029', commonEventPublishData, this.publishCallback);
  }

  private Sub_Misc_inputMethod_onDeleteLeft_static_0100(): void {
    console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 data`);     
    try {
      inputMethodAbility!.onInputStart((KeyboardDelegate: inputMethodEngine.KeyboardController, InputClient: inputMethodEngine.InputClient): void => {
        console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 inputStart`); 
        inputMethodAbility!.offInputStart();
        if(InputClient == null) {
          console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 InputClient is null`); 
        } else {
          setTimeout(async (): void => {
            try {
              let bool = await InputClient!.deleteForward(1);
              console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 deleteForward: ${bool}`);
            } catch (err) {
              console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 catch err: ${JSON.stringify(err)}`);
            }
          }, 500)
        }
      })
    } catch (err) {
      console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteLeft_static_0100 try catch err: ${JSON.stringify(err)}`);
    }
  }

  private inputMethodAbility_test_static_030(): void {
    console.info(`${TAG} ====>inputMethodAbility_test_static_030 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.deleteForward(1, (err: BusinessError | null, value: boolean | undefined): void => {
      if (err) {
        console.info(`${TAG} ====>inputMethodAbility_test_static_030 deleteForward err: ${JSON.stringify(err)}`);
      } else {
        console.info(`${TAG} ====>inputMethodAbility_test_static_030 deleteForward value: ${JSON.stringify(value)}`);
        if (typeof value === 'boolean') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      }
      commonEventManager.publish('inputMethodAbility_test_static_030', commonEventPublishData, this.publishCallback);
    })
  }

  async inputMethodAbility_test_static_031() {
    console.info(`${TAG} ====>inputMethodAbility_test_static_031 data`); 
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let value: boolean = await this.InputClient!.deleteForward(1);
    if (typeof value === 'boolean') {
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    }
    commonEventManager.publish('inputMethodAbility_test_static_031', commonEventPublishData, this.publishCallback);
  }

  private Sub_Misc_inputMethod_onDeleteRight_static_0210(): void {
    console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 data`);     
    try {
      inputMethodAbility!.onInputStart((KeyboardDelegate: inputMethodEngine.KeyboardController, InputClient: inputMethodEngine.InputClient): void => {
        console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 inputStart`); 
        inputMethodAbility!.offInputStart((): void => {});
        if(InputClient == null) {
          console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 InputClient is null`); 
        } else {
          setTimeout(async () => {
            try {
              let bool = await InputClient!.deleteBackward(1);
              console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 deleteForward: ${bool}`);
            } catch (err) {
              console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 catch err: ${JSON.stringify(err)}`);
            }
          }, 500);
        }
      })
    } catch (err) {
      console.info(`${TAG} ====>Sub_Misc_inputMethod_onDeleteRight_static_0210 try catch err: ${JSON.stringify(err)}`);
    }
  }

  // litao
  async inputMethodAbility_test_static_032() {
    console.info(TAG + '====>receive inputMethodAbility_test_static_032 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.deleteBackward(1, (err, value) => {
      if (err) {
        console.info(TAG + '====>inputMethodAbility_test_static_032 deleteBackward err:' + JSON.stringify(err));
        commonEventPublishData = {
          data: "FAILED"
        };
      } else {
        console.info(TAG + '====>inputMethodAbility_test_static_032 deleteBackward value:' + JSON.stringify(value));
        if (value) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        } else {
          commonEventPublishData = {
            data: "FAILED"
          };
        }
      }
      commonEventManager.publish("inputMethodAbility_test_static_032", commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_static_033() {
    console.info(TAG + '====>receive inputMethodAbility_test_static_033 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let value: boolean = await this.InputClient!.deleteBackward(1);
    console.info(TAG + '====>inputMethodAbility_test_static_033 deleteBackward value:' + JSON.stringify(value));
    if (value) {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } else {
      commonEventPublishData = {
        data: "FAILED"
      };
    }
    commonEventManager.publish("inputMethodAbility_test_static_033", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_static_034() {
    console.info(TAG + '====>receive inputMethodAbility_test_static_034 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.insertText('test', (err, value) => {
      if (err) {
        console.info(TAG + '====>inputMethodAbility_test_static_034 insertText err:' + JSON.stringify(err));
        commonEventPublishData = {
          data: "FAILED"
        };
      } else {
        console.info(TAG + '====>inputMethodAbility_test_static_034 insertText value:' + JSON.stringify(value));
        if (value) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        } else {
          commonEventPublishData = {
            data: "FAILED"
          };
        }
      }
      commonEventManager.publish("inputMethodAbility_test_static_034", commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_static_035() {
    console.info(TAG + '====>receive inputMethodAbility_test_static_035 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let value: boolean = await this.InputClient!.insertText('test');
    console.info(TAG + '====>inputMethodAbility_test_static_035 insertText value:' + JSON.stringify(value));
    if (value) {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } else {
      commonEventPublishData = {
        data: "FAILED"
      };
    }
    commonEventManager.publish("inputMethodAbility_test_static_035", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_036() {
    console.info(TAG + '====>receive inputMethodAbility_test_036 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.getForward(1, (err, value) => {
      if (err) {
        console.info(TAG + '====>inputMethodAbility_test_036 getForward err:' + JSON.stringify(err));
        commonEventPublishData = {
          data: "FAILED"
        };
      } else {
        console.info(TAG + '====>inputMethodAbility_test_036 getForward value:' + JSON.stringify(value));
        if (typeof (value) !== null) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        } else {
          commonEventPublishData = {
            data: "FAILED"
          };
        }
      }
      commonEventManager.publish("inputMethodAbility_test_036", commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_037() {
    console.info(TAG + '====>receive inputMethodAbility_test_037 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let value: string = await this.InputClient!.getForward(1);
    console.info(TAG + '====>inputMethodAbility_test_037 getForward value' + JSON.stringify(value));
    if (typeof (value) !== null) {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } else {
      commonEventPublishData = {
        data: "FAILED"
      };
    }
    commonEventManager.publish("inputMethodAbility_test_037", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_042() {
    console.info(TAG + '====>receive inputMethodAbility_test_042 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.getBackward(1, (err, value) => {
      if (err) {
        console.info(TAG + '====>inputMethodAbility_test_042 getBackward err:' + JSON.stringify(err));
        commonEventPublishData = {
          data: "FAILED"
        };
      } else {
        console.info(TAG + '====>inputMethodAbility_test_042 getBackward value:' + JSON.stringify(value));
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish("inputMethodAbility_test_042", commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_043() {
    console.info(TAG + '====>receive inputMethodAbility_test_043 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let value: string = await this.InputClient!.getBackward(1);
    console.info(TAG + '====>inputMethodAbility_test_043 getBackward value:' + JSON.stringify(value));
    commonEventPublishData = {
      data: "SUCCESS"
    };
    commonEventManager.publish("inputMethodAbility_test_043", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_045() {
    console.info(TAG + '====>receive inputMethodAbility_test_045 data');
    setTimeout(() => {
      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
        data: 'FAILED'
      };
      this.InputClient!.moveCursor(inputMethodEngine.CURSOR_UP, (err, value) => {
        if (err) {
          console.info(TAG + '====>inputMethodAbility_test_045 CURSOR_UP err:' + JSON.stringify(err));
          commonEventPublishData = {
            data: "FAILED"
          };
        } else {
          console.info(TAG + '====>inputMethodAbility_test_045 CURSOR_UP value:' + JSON.stringify(value));
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commonEventManager.publish("inputMethodAbility_test_045", commonEventPublishData, this.publishCallback);
      });
    }, 1000);
  }

  async inputMethodAbility_test_046() {
    console.info(TAG + '====>receive inputMethodAbility_test_046 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.moveCursor(inputMethodEngine.CURSOR_DOWN, (err, value) => {
      if (err) {
        console.info(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN err:' + JSON.stringify(err));
        commonEventPublishData = {
          data: "FAILED"
        };
      } else {
        console.info(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN value:' + JSON.stringify(value));
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish("inputMethodAbility_test_046", commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_047() {
    console.info(TAG + '====>receive inputMethodAbility_test_047 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    await this.InputClient!.moveCursor(inputMethodEngine.CURSOR_LEFT);
    console.info(TAG + '====>inputMethodAbility_test_047 CURSOR_LEFT success');
    commonEventPublishData = {
      data: "SUCCESS"
    };
    commonEventManager.publish("inputMethodAbility_test_047", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_048() {
    console.info(TAG + '====>receive inputMethodAbility_test_048 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    await this.InputClient!.moveCursor(inputMethodEngine.CURSOR_RIGHT);
    console.info(TAG + '====>inputMethodAbility_test_048 CURSOR_RIGHT success');
    commonEventPublishData = {
      data: "SUCCESS"
    };
    commonEventManager.publish("inputMethodAbility_test_048", commonEventPublishData, this.publishCallback);
  }

  async Sub_Misc_inputMethod_getEditorAttribute_sync_0230() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_getEditorAttribute_sync_0230 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let obj = this.InputClient!.getEditorAttributeSync();
    console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 getEditorAttributeSync enterKeyType: ' +
    JSON.stringify(obj!.enterKeyType));
    console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 getEditorAttributeSync inputPattern: ' +
    JSON.stringify(obj!.inputPattern!));
    console.info(TAG +
      '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 getEditorAttributeSync isTextPreviewSupported: ' +
    JSON.stringify(obj!.isTextPreviewSupported!));
    let exConfig:InputMethodExtraConfig = obj!.extraConfig as InputMethodExtraConfig;
    let customSettings = exConfig.customSettings;
    if (typeof (obj!.enterKeyType) === 'int' && typeof (obj!.inputPattern) === 'int' &&
      typeof (obj!.isTextPreviewSupported) === 'boolean' && typeof (obj!.windowId) === 'int' &&
 	       typeof (obj!.placeholder) === 'string' && typeof (obj!.immersiveMode) === 'int' &&
 	       typeof (obj!.gradientMode) === 'int' && typeof (obj!.extraConfig) === 'object' &&
 	       typeof (obj!.capitalizeMode) === 'int' && typeof (obj!.bundleName) === 'string' &&
 	       typeof (obj!.displayId) === 'long' && typeof (obj!.abilityName) === 'string') {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    }
    commonEventManager.publish("Sub_Misc_inputMethod_getEditorAttribute_sync_0230", commonEventPublishData,
      this.publishCallback);
  }

  async inputMethodAbility_test_101() {
    console.info(TAG + '====>receive inputMethodAbility_test_101 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let range: inputMethodEngine.Range = { start: 0, end: 1 };
    try {
      this.InputClient!.selectByRange(range, (err) => {
        if (err) {
          console.info(TAG + '====>inputMethodAbility_test_101 selectByRange err:' + JSON.stringify(err));
          commonEventPublishData = {
            data: "FAILED"
          };
        } else {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commonEventManager.publish("inputMethodAbility_test_101", commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      commonEventPublishData = {
        data: "FAILED"
      };
      console.info(TAG + '====>inputMethodAbility_test_101 selectByRange throw_err:');
      commonEventManager.publish("inputMethodAbility_test_101", commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodAbility_test_102() {
    console.info(TAG + '====>receive inputMethodAbility_test_102 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let range: inputMethodEngine.Range = { start: 1, end: 0 };
    try {
      await this.InputClient!.selectByRange(range);
      console.info(TAG + '====>inputMethodAbility_test_102 selectByRange success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      commonEventPublishData = {
        data: "FAILED"
      };
      console.info(TAG + '====>inputMethodAbility_test_102 selectByRange catch err:' + JSON.stringify(err));
    }
    commonEventManager.publish("inputMethodAbility_test_102", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_103() {
    console.info(TAG + '====>receive inputMethodAbility_test_103 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.getTextIndexAtCursor((err, value) => {
        if (err) {
          console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor err:' + JSON.stringify(err));
        } else {
          console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor success' + JSON.stringify(value));
          if (typeof value === 'int') {
            commonEventPublishData = {
              data: "SUCCESS"
            };
          }
        }
        commonEventManager.publish("inputMethodAbility_test_103", commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor throw_err:');
      commonEventManager.publish("inputMethodAbility_test_103", commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodAbility_test_104() {
    console.info(TAG + '====>receive inputMethodAbility_test_104 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let value: int = await this.InputClient!.getTextIndexAtCursor();
      console.info(TAG + '====>inputMethodAbility_test_104 getTextIndexAtCursor value:' + JSON.stringify(value));
      if (typeof value === 'int') {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      } else {
        commonEventPublishData = {
          data: "FAILED"
        };
      }
    } catch (err) {
      commonEventPublishData = {
        data: "FAILED"
      };
      console.info(TAG + '====>inputMethodAbility_test_104 getTextIndexAtCursor catch err:');
    }
    commonEventManager.publish("inputMethodAbility_test_104", commonEventPublishData, this.publishCallback);
  }

  async inputMethodAbility_test_105() {
    console.info(TAG + '====>receive inputMethodAbility_test_105 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let movement: inputMethodEngine.Movement = { direction: inputMethodEngine.Direction.CURSOR_RIGHT };
    try {
      this.InputClient!.selectByMovement(movement, (err) => {
        if (err) {
          console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement err:' + JSON.stringify(err));
          commonEventPublishData = {
            data: "FAILED"
          };
        } else {
          console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement success');
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commonEventManager.publish("inputMethodAbility_test_105", commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      commonEventPublishData = {
        data: "FAILED"
      };
      console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement throw_err:');
      commonEventManager.publish("inputMethodAbility_test_105", commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodAbility_test_106() {
    console.info(TAG + '====>receive inputMethodAbility_test_106 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let movement: inputMethodEngine.Movement = { direction: inputMethodEngine.Direction.CURSOR_RIGHT };
    try {
      await this.InputClient!.selectByMovement(movement);
      console.info(TAG + '====>inputMethodAbility_test_106 selectByMovement success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      commonEventPublishData = {
        data: "FAILED"
      };
      console.info(TAG + '====>inputMethodAbility_test_106 getTextIndexAtCursor catch err:');
    }
    commonEventManager.publish("inputMethodAbility_test_106", commonEventPublishData, this.publishCallback);
  }

  async Sub_Misc_inputMethod_selectByRange_sync_0280() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByRange_sync_0280 data');
    let range: inputMethodEngine.Range = { start: 0, end: 1 };
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.selectByRangeSync(range);
      console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0280 selectByRangeSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0280 selectByRangeSync err: ' +
      JSON.stringify(err));
    }
    commonEventManager.publish("Sub_Misc_inputMethod_selectByRange_sync_0280", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementPromise_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let movement: inputMethodEngine.Movement = { direction: inputMethodEngine.Direction.CURSOR_UP };
    try {
      await this.InputClient!.selectByMovement(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 catch err: ' + JSON.stringify(err));
    }
    commonEventManager.publish('Sub_InputMethod_IME_InputClientselectByMovementPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let num = this.InputClient!.getTextIndexAtCursorSync();
    console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 getTextIndexAtCursorSync num: ' +
    JSON.stringify(num));
    if (typeof (num) === "int") {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    }
    commonEventManager.publish("Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.sendExtendAction(inputMethodEngine.ExtendAction.PASTE, (err) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 sendExtendAction success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commonEventManager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 catch err: ' + JSON.stringify(err));
      commonEventManager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient!.sendExtendAction(inputMethodEngine.ExtendAction.CUT);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 sendExtendAction success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commonEventManager.publish('Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async SUB_InputMethod_IsTextPreviewSupport_0100() {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputMethodEngine.Range = { start: -1, end: -2 }
      await this.InputClient!.setPreviewText('adc|03', range);
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0100 setPreviewText success:');
      commonEventPublishData = {
        data: "FAILED"

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0100 setPreviewText catch err: ' +
      JSON.stringify(err));
      if (err.code === 401) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
    }
    commonEventManager.publish("SUB_InputMethod_IsTextPreviewSupport_0100", commonEventPublishData,
      this.publishCallback);
  }

  async inputMethodAbility_test_070() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_070 success');
    let count = 0;
    await this.keyboardController!.hide();
    inputMethodAbility!.onKeyboardShow(() => {
      inputMethodAbility!.offKeyboardShow();
      console.info(TAG + '====>inputMethodAbility.on("keyboardShow") count: ' + count);
      count += 1;
    });
    inputMethodAbility!.onSetSubtype(() => {
      inputMethodAbility!.offSetSubtype();
      console.info(TAG + '====>inputMethodAbility.on("setSubtype") count: ' + count);
      count += 1;
    });

    setTimeout(() => {
      if (count === 1) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish("inputMethodAbility_test_070", commonEventPublishData, this.publishCallback);
    }, 2000);
  }

  async inputMethodAbility_test_071() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_071 success');
    let count = 0;
    inputMethodAbility!.onKeyboardHide(() => {
      count += 1;
      inputMethodAbility!.offKeyboardHide();
      console.info(TAG + '====>inputMethodAbility.off("keyboardHide") count: ' + count);
    });
    await Utils.msSleep(500)
    await this.keyboardController!.hide();
    console.info(TAG + '====>inputMethodAbility_test_071 hideKeyboard success');
    setTimeout(() => {
      if (count === 1) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish("inputMethodAbility_test_071", commonEventPublishData, this.publishCallback);
    }, 2000);
  }

  async inputMethodAbility_test_072() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_072 success');
    let count = 0;
    await this.keyboardController!.hide();
    inputMethodAbility!.onKeyboardShow(() => {
      count += 1;
      inputMethodAbility!.offKeyboardShow((): void => {});
      console.info(TAG + '====>inputMethodAbility.off("keyboardShow") count: ' + count);
    });
    setTimeout(() => {
      if (count === 1) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish("inputMethodAbility_test_072", commonEventPublishData, this.publishCallback);
    }, 2000);
  }

  async inputMethodAbility_test_073() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_073 success');
    let count = 0;
    inputMethodAbility!.onKeyboardHide(() => {
      count += 1;
      inputMethodAbility!.offKeyboardHide((): void => {});
      console.info(TAG + '====>inputMethodAbility.off("keyboardHide") count: ' + count);
    });
    await Utils.msSleep(500)
    await this.keyboardController!.hide();
    console.info(TAG + '====>inputMethodAbility_test_073 hideKeyboard success');
    setTimeout(() => {
      if (count === 1) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodAbility_test_073', commonEventPublishData, this.publishCallback);
    }, 2000);
  }

  async inputMethodAbility_test_074() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_074 success');
    inputMethodAbility!.onSetCallingWindow((wid) => {
      console.info(TAG + "====>inputKeyboardDelegate.on('setCallingWindow')" + wid);
      inputMethodAbility!.offSetCallingWindow( () => {
        console.log('inputMethodAbility off setCallingWindow');
      });
      if (typeof (wid) === 'int') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodAbility_test_074', commonEventPublishData, this.publishCallback);
    });
  }

  async inputMethodAbility_test_075() {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive inputMethodAbility_test_075 success');
    let count = 0;
    await this.keyboardController!.hide();
    inputMethodAbility!.onKeyboardShow(() => {
      inputMethodAbility!.offKeyboardShow();
      console.info(TAG + '====>inputMethodAbility.on("keyboardShow") count: ' + count);
      count += 1;
    });
    inputMethodAbility!.onSetSubtype(() => {
      inputMethodAbility!.offSetSubtype((): void => {});
      console.info(TAG + '====>inputMethodAbility.on("setSubtype") count: ' + count);
      count += 1;
    });

    setTimeout(() => {
      if (count === 1) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish('inputMethodAbility_test_075', commonEventPublishData, this.publishCallback);
    }, 2000);
  }

  async SUB_InputMethod_IME_onoffsecurityModeChanged_0100() {
    console.info(TAG + '====>receive SUB_InputMethod_IME_onoffsecurityModeChanged_0100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility!.onSecurityModeChange((securityMode: inputMethodEngine.SecurityMode) => {
        console.log(`InputMethodAbility securityModeChange, security is ${securityMode}`);
      })
      inputMethodAbility!.offSecurityModeChange();
      commonEventPublishData = {
        data: "SUCCESS"
      };
      console.info(TAG + '====>SUB_InputMethod_IME_onoffsecurityModeChanged_0100 privateCommand on success');
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IME_onoffsecurityModeChanged_0100 on(privateCommand) err: ' + JSON.stringify(err));
    }
    commonEventManager.publish("SUB_InputMethod_IME_onoffsecurityModeChanged_0100", commonEventPublishData, this.publishCallback);
  }

  async SUB_InputMethod_IME_onoffsecurityModeChanged_0200() {
    console.info(TAG + '====>receive SUB_InputMethod_IME_onoffsecurityModeChanged_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility!.onSecurityModeChange((securityMode: inputMethodEngine.SecurityMode) => {
        console.log(`InputMethodAbility securityModeChange, security is ${securityMode}`);
      })
      inputMethodAbility!.offSecurityModeChange((): void => {});
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>SUB_InputMethod_IME_onoffsecurityModeChanged_0200 privateCommand on success');
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IME_onoffsecurityModeChanged_0200 on(privateCommand) err: ' + JSON.stringify(err));
    }
    commonEventManager.publish('SUB_InputMethod_IME_onoffsecurityModeChanged_0200', commonEventPublishData, this.publishCallback);
  }

  async inputMethodEngine_test_exitCurrentInputType_static_0200(): Promise<void> {
    console.info(TAG + '====>receive inputMethodEngine_test_exitCurrentInputType_static_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.keyboardController!.exitCurrentInputType((err) => {
        if (err) {
          console.info(TAG + '====>inputMethodEngine_test_exitCurrentInputType_static_0200 exitCurrentInputType failed: ' +
          JSON.stringify(err));
          if (err.code === 12800010) {
            commonEventPublishData = {
              data: 'SUCCESS'
            }
          }
        }
        commonEventManager.publish('inputMethodEngine_test_exitCurrentInputType_static_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>inputMethodEngine_test_exitCurrentInputType_static_0200 deleteBackwardSync  err ');
      commonEventManager.publish('inputMethodEngine_test_exitCurrentInputType_static_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async inputMethodEngine_test_static_028(): Promise<void> {
    console.info(TAG + '====>receive inputMethodEngine_test_static_028 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.sendKeyFunction(1, (err, value) => {
      if (err) {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>inputMethodEngine_test_static_028 TextInputClient sendKeyFunction err: ' +
          JSON.stringify(err));
      } else {
        console.info(TAG + '====>inputMethodEngine_test_static_028 TextInputClient sendKeyFunction value: ' +
          JSON.stringify(value));
        if (value) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
        }

      }
      commonEventManager.publish('inputMethodEngine_test_static_028', commonEventPublishData, this.publishCallback);
    })
  }  

  async Sub_Misc_inputMethod_deleteForward_sync_static_0250() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteForward_sync_static_0250 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.deleteForwardSync(1);
      console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_static_0250 deleteForwardSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_static_0250 deleteForwardSync err: ' +
      JSON.stringify(err));
    }
    commonEventManager.publish("Sub_Misc_inputMethod_deleteForward_sync_static_0250", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_deleteBackward_sync_static_0260() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteBackward_sync_static_0260 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.deleteBackwardSync(1);
      console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_static_0260 deleteBackwardSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_static_0260 deleteBackwardSync err: ' +
      JSON.stringify(err));
    }
    commonEventManager.publish("Sub_Misc_inputMethod_deleteBackward_sync_static_0260", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_insertText_sync_static_0270() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_insertText_sync_static_0270 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.InputClient!.insertTextSync('test');
    console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_static_0270 insertTextSync');
    commonEventPublishData = {
      data: "SUCCESS"
    };
    commonEventManager.publish("Sub_Misc_inputMethod_insertText_sync_static_0270", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_getForward_sync_0200() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_getForward_sync_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let str = this.InputClient!.getForwardSync(1);
    console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0200 getForwardSync str: ' + JSON.stringify(str));
    if (typeof (str) === "string") {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    }
    commonEventManager.publish("Sub_Misc_inputMethod_getForward_sync_0200", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_getBackward_sync_0210() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_getBackward_sync_0210 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let str = this.InputClient!.getBackwardSync(1);
    console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0210 getBackwardSync str: ' + JSON.stringify(str));
    if (typeof (str) === "string") {
      commonEventPublishData = {
        data: "SUCCESS"
      };
    }
    commonEventManager.publish("Sub_Misc_inputMethod_getBackward_sync_0210", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_moveCursor_sync_0240() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_moveCursor_sync_0240 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.moveCursorSync(inputMethodEngine.CURSOR_UP);
      console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0240 moveCursorSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0240 moveCursorSync err: ' + JSON.stringify(err));
    }
    commonEventManager.publish("Sub_Misc_inputMethod_moveCursor_sync_0240", commonEventPublishData,
      this.publishCallback);
  }

  async Sub_Misc_inputMethod_selectByMovement_sync_0290() {
    console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByMovement_sync_0290 data');
    let movement: inputMethodEngine.Movement = { direction: inputMethodEngine.Direction.CURSOR_DOWN };
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.selectByMovementSync(movement);
      console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0290 selectByMovementSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      };
    } catch (err) {
      console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0290 selectByMovementSync err: ' +
      JSON.stringify(err));
    }
    commonEventManager.publish("Sub_Misc_inputMethod_selectByMovement_sync_0290", commonEventPublishData,
      this.publishCallback);
  }

  private async SUB_InputMethod_IME_SplitScreen_0100(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 start');
    try {
      if (this.softKeyboardPanel !== null) {
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 this.softKeyboardPanel:' + this.softKeyboardPanel);
        try {
          await Utils.msSleep(500);
          let WindowInfo = await this.InputClient!.getCallingWindowInfo();
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo WindowInfo:' + JSON.stringify(WindowInfo));
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo  rect: ' + JSON.stringify(WindowInfo!.rect));
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo  status: ' + JSON.stringify(WindowInfo!.status));
          if (typeof (WindowInfo) === 'object' && typeof (WindowInfo!.rect) === 'object' && typeof (WindowInfo!.status) === 'int') {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo WindowInfo:  success');
        } catch (err) {
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInf0 err: ' + JSON.stringify(err.message));
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInf0 err: ' + JSON.stringify(err.code));
          console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfO err: ' + err);
        };
        commonEventManager.publish('SUB_InputMethod_IME_SplitScreen_0100', commonEventPublishData, this.publishCallback);
      } else {
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo softKeyboardPanel is null ');
      };

    } catch (error) {
      console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 catch error: ' + JSON.stringify(error.message));
      console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 catch error: ' + JSON.stringify(error.code));
      commonEventManager.publish('SUB_InputMethod_IME_SplitScreen_0100', commonEventPublishData, this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_0200() {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0200 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let range: inputMethodEngine.Range = { start: -1, end: -4 }
    try {
      this.InputClient!.setPreviewTextSync('adc|03', range);
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0100 setPreviewText success:');
      commonEventPublishData = {
        data: "FAILED"

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0200 setPreviewTextSync catch err:' +
      JSON.stringify(err));
      if (err.code === 401) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
      }
      commonEventManager.publish('SUB_InputMethod_IsTextPreviewSupport_0200', commonEventPublishData,
        this.publishCallback);
    }
  }

  async SUB_InputMethod_IsTextPreviewSupport_0300() {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0300 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient!.finishTextPreview();
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0300 finishTextPreview success');
      commonEventPublishData = {
        data: "SUCCESS"
      }
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0300 finishTextPreview catch err:' +
      JSON.stringify(err));
    }
    commonEventManager.publish("SUB_InputMethod_IsTextPreviewSupport_0300", commonEventPublishData,
      this.publishCallback);
  }

  async SUB_InputMethod_IsTextPreviewSupport_0400() {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0400 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.finishTextPreviewSync();
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0400 finishTextPreviewSync success');
      commonEventPublishData = {
        data: "SUCCESS"
      }

    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0400 finishTextPreviewSync catch err:' +
      JSON.stringify(err));
    }
    commonEventManager.publish('SUB_InputMethod_IsTextPreviewSupport_0400', commonEventPublishData,
      this.publishCallback);
  }

  private SUB_Misc_InputMethod_Manage_Physical_Buttons_0010(): void {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 success');
    inputKeyboardDelegate!.onKeyEvent((KeyEvents) => {
      inputKeyboardDelegate!.offKeyEvent((KeyEvents) => {
        console.info(TAG + "====>inputKeyboardDelegate.off('KeyEvents')");
        return true;
      });
      console.info(TAG + "====>inputKeyboardDelegate.on('KeyEvents')");
      try {
        console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyEvent: " + KeyEvents.action);
        console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyEvent: " + KeyEvents.key.code);
        if (KeyEvents.key.code === 2045) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
      } catch (err) {
        console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyDown throw_error: " + err);
      }
      return true;
    });
    setTimeout(() => {
      commonEventManager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0010", commonEventPublishData,
        this.publishCallback);
    }, 800);
  }

  private async Sub_Misc_inputMethod_Panel_onSizeChange_static_0100(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onSizeChange(async (size: window.Size, keyboardArea?: inputMethodEngine.KeyboardArea):void => {
          if (typeof (keyboardArea!.top) === 'int' && typeof (keyboardArea!.bottom) === 'int' && typeof (keyboardArea!.left) === 'int' && typeof (keyboardArea!.right) === 'int') {
            commonEventPublishData = {
                data: 'SUCCESS'
            };
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 onSizeChange');
          this.softKeyboardPanel!.offSizeChange(()=>{});
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 offSizeChange');
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0100', commonEventPublishData, this.publishCallback);
        });
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 displayInfo.width1: ' + this.displayInfo!.width);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 displayInfo.height1: ' + this.displayInfo!.height);
        await this.softKeyboardPanel!.resize(200, 100);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 displayInfo.width2: ' + this.displayInfo!.width);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 displayInfo.height2: ' + this.displayInfo!.height);
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0100', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0100 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onSizeChange_static_0200(): Promise<void> {
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel!.onSizeChange((size: window.Size) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 onSizeChange');
          this.softKeyboardPanel!.offSizeChange();
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 off SizeChange count: ' + count);
        });
        let flage:boolean = true;
        let intervalID:int = 0;
        intervalID = setInterval(async () => {
          if (flage === true) {
            flage = false;
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 displayInfo.width: ' + this.displayInfo!.width);
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 displayInfo.height: ' + this.displayInfo!.height);
            await this.softKeyboardPanel!.resize(200, 120);
          } else {
            flage = true;
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 displayInfo.width: ' + this.displayInfo!.width);
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 displayInfo.height: ' + this.displayInfo!.height);
            await this.softKeyboardPanel!.resize(200, 130);
          };
          timeCount += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(intervalID);
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 clearInterval success');
          };
        }, 100);

        setTimeout(() => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
          commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0200', commonEventPublishData, this.publishCallback);
        }, 500);

      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 this.softKeyboardPanel is null');
        commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0200', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_static_0200 catch error: ' + JSON.stringify(error));
      commonEventManager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_static_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IMF_DiscardTypingText_static_1000(): Promise<void> {
    let caseName: string = 'Sub_InputMethod_IMF_DiscardTypingText_static_1000';
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let count1 = 0;
    let count2 = 0;
    let callback1 = (): void => {
      console.info(TAG + `====> ${caseName}  callback1  is success`);
      ++count1;
    };
    let callback2 = (): void => {
      console.info(TAG + `====> ${caseName}  callback2  is success`);
      ++count2;
    };
    inputMethodAbility!.onDiscardTypingText(callback1);
    inputMethodAbility!.onDiscardTypingText(callback2);
    inputMethodAbility!.offDiscardTypingText(callback1);
    setTimeout(() => {
      console.info(TAG + `====> ${caseName}  count1 = ${count1}, count2 = ${count2}`);
      if (count1 === 0 && count2 === 1) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      inputMethodAbility!.offDiscardTypingText();
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }, 1000);
  }

  async Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_static_0100(): Promise<void> {
    let caseName: string = 'Sub_Misc_inputMethodEngine_InputClient_getAttachOptions_static_0100';
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let attachOptions = this.InputClient!.getAttachOptions();
      console.info(TAG + `====>${caseName}  attachOptions is ` + JSON.stringify(attachOptions));
      let result:inputMethodEngine.RequestKeyboardReason = attachOptions!.requestKeyboardReason!;
      let result1:boolean = attachOptions!.isSimpleKeyboardEnabled!;
      if (result === inputMethodEngine.RequestKeyboardReason.NONE) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_static_0100(): Promise<void> {
    let caseName: string = 'Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_static_0100';
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.onAttachOptionsDidChange((newAttachOptions: inputMethodEngine.AttachOptions) => {
          console.info(TAG + `====>${caseName}  newAttachOptions is ` + JSON.stringify(newAttachOptions));
          let result:inputMethodEngine.RequestKeyboardReason = newAttachOptions!.requestKeyboardReason!;
          let result1:boolean = newAttachOptions!.isSimpleKeyboardEnabled!;
          if (result === inputMethodEngine.RequestKeyboardReason.TOUCH) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          this.InputClient!.offAttachOptionsDidChange();
          commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
        });
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  private async SUB_InputMethod_IME_SplitScreen_static_0101(): Promise<void> {
    let caseName: string = 'SUB_InputMethod_IME_SplitScreen_static_0101';
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + `====>${caseName} start`);
    try {
      if (this.softKeyboardPanel !== null) {
        await inputMethodAbility!.destroyPanel(this.softKeyboardPanel!);
        console.info(TAG + `====>${caseName} destroyPanel success`);
        try {
          let WindowInfo = await this.InputClient!.getCallingWindowInfo();
          console.info(TAG + `====>${caseName} getCallingWindowInfo success`);
        } catch (err) {
          console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
          if (err.code === 12800012) {
            commonEventPublishData = {
              data: 'SUCCESS'
            }
          }
        };
        commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
      } else {
        console.info(TAG + `====>${caseName} getCallingWindowInfo softKeyboardPanel is null`);
      };
    } catch (error) {
      console.info(TAG + `====>${caseName} catch err.code:${error.code} err.message:${error.message}`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_static_0200(): Promise<void> {
    let caseName: string = 'Sub_Misc_inputMethodEngine_InputClient_onAttachOptionsDidChange_static_0200';
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient!.onAttachOptionsDidChange((newAttachOptions: inputMethodEngine.AttachOptions) => {
          console.info(TAG + `====>${caseName}  newAttachOptions is ` + JSON.stringify(newAttachOptions));
          let result:inputMethodEngine.RequestKeyboardReason = newAttachOptions!.requestKeyboardReason!;
          if (result === inputMethodEngine.RequestKeyboardReason.TOUCH) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          this.InputClient!.offAttachOptionsDidChange((): void => {});
          commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
        });
    } catch (err) {
      console.info(TAG + `====>${caseName} catch err.code:${ err.code} err.message:${ err.message}`);
      commonEventManager.publish(caseName, commonEventPublishData, this.publishCallback);
    }
  } 

  async SUB_InputMethod_IME_PrivateDateTransferred_static_1100() {
    console.info(TAG + '====>receive SUB_InputMethod_IME_PrivateDateTransferred_static_1100 data');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    let want: Want = {
      bundleName: 'aaa',
      abilityName: 'aaa',
    }
    try {
      await this.mContext!.startAbility(want);
      console.info(TAG + '====>SUB_InputMethod_IME_PrivateDateTransferred_static_1100 startAbility success');
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IME_PrivateDateTransferred_static_1100 err: ' + JSON.stringify(err));
      if (err.code === 16000001) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    }
    commonEventManager.publish('SUB_InputMethod_IME_PrivateDateTransferred_static_1100', commonEventPublishData,
      this.publishCallback);
  }

  public async offInputStop_test1() {
    console.info(TAG + '====>inputMethodAbility_test_091.offInputStop_test callback');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    this.mContext!.destroy((err) => {
      console.info(TAG + '====>inputMethodAbility offInputStop_test destroy err: ' + JSON.stringify(err));
      commonEventManager.publish('inputMethodAbility_test_091', commonEventPublishData, () => {
      });
    })
  }

  public async offInputStop_test() {
    console.info(TAG + '====>inputMethodAbility_test_092.offInputStop_test callback');
    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.mContext!.destroy();
    } catch (err) {
      console.info(TAG + '====>inputMethodAbility offInputStop_test destroy err: ' + JSON.stringify(err));
      commonEventManager.publish('inputMethodAbility_test_092', commonEventPublishData, () => {
      });
    }
  }

}