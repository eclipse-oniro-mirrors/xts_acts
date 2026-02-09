/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import inputmethodengine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commoneventmanager from '@ohos.commonEventManager';
import prompt from '@ohos.prompt';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { util } from '@kit.ArkTS';

let inputMethodAbility = inputmethodengine.getInputMethodAbility();
const TAG = 'keyboardController';
const SOFT_KEYBOARD = 0;
const STATUS_BAR = 1;
const FLG_FIXED = 0;
const FLG_FLOATING = 1;

let panelInfo = {
  type: SOFT_KEYBOARD,
  flag: FLG_FLOATING
};

export class KeyboardController {
  mContext;
  storage: LocalStorage;
  WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
  windowName = 'inputApp';

  private softKeyboardPanel: inputMethodEngine.Panel = null;
  private windowHeight: number = 0;
  private windowWidth: number = 0;
  private nonBarPosition: number = 0;
  private keyboardController: inputMethodEngine.KeyboardController;
  private InputClient: inputMethodEngine.InputClient;
  private display_info = display.getDefaultDisplaySync();
  private immersive: number = 0;

  constructor(context) {
    this.storage = new LocalStorage();
    this.storage.setOrCreate('storageSimplePorp', 121);
    this.mContext = context;
    this.windowWidth = this.display_info.width;
    this.windowHeight = this.display_info.height * 0.45;
  }

  public onCreate(): void {
    let that = this; 
    let subscriber;    

    inputMethodAbility.createPanel(this.mContext, panelInfo, (err, panel) => {
      if (err !== undefined) {
        console.info(TAG + '====>Failed to create panel, err: ' + JSON.stringify(err));
        return;
      }
      this.softKeyboardPanel = panel;
      this.softKeyboardPanel.setUiContent('testability/pages/Second', async (err, data) => {        
        console.info(TAG + '====>Succeed in creating panel.' + JSON.stringify(panel));
      });
      try{
        let commonEventSubscribeInfo = {
          events: ['InputMethodWindManageTest']
        };
        
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          commoneventmanager.subscribe(subscriber, subscriberCallback)
          console.info(TAG + '====>scene subscribe finish====');
        })
      }catch(err){
        console.info(TAG + '====>createSubscriber err:' + JSON.stringify(err.message));
      }
    });

    inputMethodAbility.on('inputStop', async() => {
      console.info(TAG + '====>on_inputStop callback')
      inputMethodAbility.off('inputStart');
      inputMethodAbility.off('inputStop',()=>{});
      inputMethodAbility.destroyPanel(this.softKeyboardPanel);
      await that.mContext.destroy();   
      await commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
    });

    inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
      this.keyboardController = keyboardController;
      this.InputClient = InputClient
      console.info(TAG + '====>inputMethodAbility inputStart into'); 
    })
    
    let subscriberCallback = (err, data) => {
      console.debug(TAG + '====>receive event err: ' + JSON.stringify(err));
      console.debug(TAG + '====>receive event data ' + JSON.stringify(data));
      switch (data.code) {
        case 10:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_createPanelCallback_0010();
          break;
        case 20:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_createPanelPromise_0020();
          break;
        case 30:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030();
          break;
        case 40:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040();
          break;
        case 50:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0050();
          break;
        case 60:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0060();
          break;
        case 70:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0070();
          break;
        case 80:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0080();
          break;
        case 90:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_resizeCallback_0090();
          break;
        case 100:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0100 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_resizePromise_0100();
          break;
        case 110:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_moveToCallback_0110();
          break;
        case 120:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_moveToPromise_0120();
          break;
        case 130:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_showCallback_0130 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_showCallback_0130();
          break;
        case 140:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_showPromise_0140 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_showPromise_0140();
          break;
        case 150:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_hideCallback_0150 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_hideCallback_0150();
          break;
        case 160:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_hidePromise_0160 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_hidePromise_0160();
          break;
        case 170:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onShow_0170 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_onShow_0170();
          break;
        case 180:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onHide_0180 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_onHide_0180();
          break;
        case 190:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_offShow_0190 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_offShow_0190();
          break;
        case 200:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_offHide_0200 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_offHide_0200();
          break;
        case 210:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0210 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_changeFlag_0210();
          break;
        case 211:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_changeFlag_0211();
          break;
        case 212:
          console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 event:' + data.event);
          that.Sub_InputMethod_IMF_SecurityKeyboard_0600();
          break;
        case 213:
          console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 event:' + data.event);
          that.Sub_InputMethod_IMF_SecurityKeyboard_0700();
          break;
        case 214:
          console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 event:' + data.event);
          that.Sub_InputMethod_IMF_SecurityKeyboard_0800();
          break;
        case 215:
          console.debug(TAG + '====>Sub_InputMethod_IMF_getSecurityMode_0100 event:' + data.event);
          that.Sub_InputMethod_IMF_getSecurityMode_0100();
          break;
        case 216:
          console.debug(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 event:' + data.event);
          that.SUB_InputMethod_IME_SplitScreen_0100();
          break;
        case 217:
          console.debug(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0100 event:' + data.event);
          that.Sub_InputMethod_IME_ScreenRotation_0100();
          break;
        case 218:
          console.debug(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0200 event:' + data.event);
          that.Sub_InputMethod_IME_ScreenRotation_0200();
          break;
        case 230:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0900 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0900();
          break;
        case 231:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0200 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0200();
          break;
        case 232:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0800 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0800();
          break;
        case 233:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0400 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0400();
          break;
        case 234:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0300 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0300();
          break;
        case 235:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_1100 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_1100();
          break;
        case 240:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_onSizeChange_0100();
          break;
        case 241:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_onSizeChange_0200();
          break;
        case 250:
          console.debug(TAG + '====>Sub_InputMethod_IME_Dragging_1100 event:' + data.event);
          that.Sub_InputMethod_IME_Dragging_1100();
          break;
        case 251:
          console.debug(TAG + '====>Sub_InputMethod_IME_Dragging_0800 event:' + data.event);
          that.Sub_InputMethod_IME_Dragging_0800();
          break;
        case 253:
          console.debug(TAG + '====>Sub_InputMethod_IME_Dragging_0900 event:' + data.event);
          that.Sub_InputMethod_IME_Dragging_0900();
          break;
        case 260:
          console.debug(TAG + '====>Sub_InputMethod_IME_Attach_0100 event:' + data.event);
          that.Sub_InputMethod_IME_Attach_0100();
          break;
        case 261:
          console.debug(TAG + '====>Sub_InputMethod_IME_Attach_0200 event:' + data.event);
          that.Sub_InputMethod_IME_Attach_0200();
          break;
        case 262:
          console.debug(TAG + '====>Sub_InputMethod_IME_Attach_0300 event:' + data.event);
          that.Sub_InputMethod_IME_Attach_0300();
          break;
        case 263:
          console.debug(TAG + '====>Sub_InputMethod_IME_Attach_0400 event:' + data.event);
          that.Sub_InputMethod_IME_Attach_0400();
          break;
        case 270:
          console.debug(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0100 event:' + data.event);
          that.Sub_InputMethod_IME_ShowTextInput_0100();
          break;
        case 271:
          console.debug(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0200 event:' + data.event);
          that.Sub_InputMethod_IME_ShowTextInput_0200();
          break;
        case 272:
          console.debug(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0300 event:' + data.event);
          that.Sub_InputMethod_IME_ShowTextInput_0300();
          break;
        case 273:
          console.debug(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0400 event:' + data.event);
          that.Sub_InputMethod_IME_ShowTextInput_0400();
          break;
        case 280:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0100 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0100();
          break;
        case 281:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0200 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0200();
          break;
        case 282:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0500 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0500();
          break;
        case 283:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0400 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0400();
          break;
        case 284:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0300 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0300();
          break;
        case 285:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1200 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_1200();
          break;
        case 286:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0700 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0700();
          break;
        case 287:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0600 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0600();
          break;
        case 288:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0800 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0800();
          break;
        case 289:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0900 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_0900();
          break;
        case 290:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1000 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_1000();
          break;
        case 291:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenUR_0200();
          break;
        case 292:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0300 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenUR_0300();
          break;
        case 293:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0400 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenUR_0400();
          break;
        case 294:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0700 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenUR_0700();
          break;
        case 295:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenAbnormal_1100();
          break;
        case 296:
          console.debug(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 event:' + data.event);
          that.Sub_InputMethod_IME_FullScreenUR_0100();
          break;
        case 297:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_0900 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_0900();
          break;
        case 298:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_1000 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_1000();
          break;
        case 299:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_1100 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_1100();
          break;
        case 300:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_1200 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_1200();
          break;
        case 301:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_0500 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_0500();
          break;
        case 310:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_createPanelCallback_0011();
          break;
        case 320:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_createPanelPromise_0021();
          break;
        case 330:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031();
          break;
        case 340:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041();
          break;
        case 350:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0051();
          break;
        case 360:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0061();
          break;
        case 370:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0071();
          break;
        case 380:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0081();
          break;
        case 390:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_resizeCallback_0091();
          break;
        case 400:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0101 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_resizePromise_0101();
          break;
        case 410:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_moveToCallback_0111();
          break;
        case 420:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_moveToPromise_0121();
          break;
        case 430:
          console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0212 event:' + data.event);
          that.Sub_Misc_inputMethod_Panel_changeFlag_0212();
          break;
        case 440:
          console.debug(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0101 event:' + data.event);
          that.Sub_InputMethod_IME_ScreenRotation_0101();
          break;
        case 450:
          console.debug(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0101 event:' + data.event);
          that.SUB_InputMethod_IsTextPreviewSupport_0101();
          break;
        case 460:
          console.debug(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0201 event:' + data.event);
          that.SUB_InputMethod_IsTextPreviewSupport_0201();
          break;
        case 470:
          console.debug(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0301 event:' + data.event);
          that.SUB_InputMethod_IsTextPreviewSupport_0301();
          break;
        case 480:
          console.debug(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0401 event:' + data.event);
          that.SUB_InputMethod_IsTextPreviewSupport_0401();
          break;
        case 490:
          console.debug(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 event:' + data.event);
          that.SUB_InputMethod_IME_SplitScreen_0101();
          break;
        case 500:
          console.debug(TAG + '====>start_on_sendMessage event:' + data.event);
          that.start_on_sendMessage(500);
          break;
        case 501:
          console.debug(TAG + '====>start_on_sendMessage event:' + data.event);
          that.start_on_sendMessage(501);
          break;
        case 502:
          console.debug(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 event:' + data.event);
          that.Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100();
          break;
        case 503:
          console.debug(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 event:' + data.event);
          that.Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200();
          break;
        case 504:
          console.debug(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0100 event:' + data.event);
          that.Sub_InputMethod_IME_setImmersiveEffect_0100();
          break;
        case 505:
          console.debug(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0200 event:' + data.event);
          that.Sub_InputMethod_IME_setImmersiveEffect_0200();
          break;
        case 506:
          console.debug(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0300 event:' + data.event);
          that.Sub_InputMethod_IME_setImmersiveEffect_0300();
          break;
        case 507:
          console.debug(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0400 event:' + data.event);
          that.Sub_InputMethod_IME_setImmersiveEffect_0400();
          break;
        case 508:
          console.debug(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0500 event:' + data.event);
          that.Sub_InputMethod_IME_setImmersiveEffect_0500();
          break;
        case 509:
          console.debug(TAG + '====>Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100 event:' + data.event);
          that.Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100();
          break;
        case 510:
          console.debug(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0100 event:' + data.event);
          that.Sub_InputMethod_IME_setKeepScreenOn_0100();
          break;
        case 511:
          console.debug(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0200 event:' + data.event);
          that.Sub_InputMethod_IME_setKeepScreenOn_0200();
          break;
        case 520:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0901 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0901();
          break;
        case 530:
          console.debug(TAG + '====>Sub_InputMethod_IME_Custom_0902 event:' + data.event);
          that.Sub_InputMethod_IME_Custom_0902();
          break;
        case 540:
          console.debug(TAG + '====>Sub_InputMethod_IME_Immersive_0600 event:' + data.event);
          that.Sub_InputMethod_IME_Immersive_0600();
          break;
        case 541:
          console.debug(TAG + '====>Sub_InputMethod_IME_OffsetArea_0100 event:' + data.event);
          that.Sub_InputMethod_IME_OffsetArea_0100();
          break;
        case 542:
          console.debug(TAG + '====>Sub_InputMethod_IME_OffsetArea_1200 event:' + data.event);
          that.Sub_InputMethod_IME_OffsetArea_1200();
          break;
        case 543:
          console.debug(TAG + '====>Sub_InputMethod_IME_OffsetArea_1000 event:' + data.event);
          that.Sub_InputMethod_IME_OffsetArea_1000();
          break;
        case 544:
          console.debug(TAG + '====>Sub_InputMethod_IME_OffsetArea_1100 event:' + data.event);
          that.Sub_InputMethod_IME_OffsetArea_1100();
          break;
        case 550:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0100 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0100();
          break;
        case 551:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0200 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0200();
          break;
        case 552:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0300 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0300();
          break;
        case 553:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0400 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0400();
          break;
        case 554:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0500 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0500();
          break;
        case 555:
          console.debug(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0600 event:' + data.event);
          that.Sub_InputMethod_IME_setSystemPanelButtonColor_0600();
          break;
        case 560:
          console.debug(TAG + '====>Sub_InputMethod_IME_Streamer_0300 event:' + data.event);
          that.Sub_InputMethod_IME_Streamer_0300();
          break;
        case 561:
          console.debug(TAG + '====>Sub_InputMethod_IME_Streamer_0500 event:' + data.event);
          that.Sub_InputMethod_IME_Streamer_0500();
          break;
        case 562:
          console.debug(TAG + '====>Sub_InputMethod_IME_Streamer_1000 event:' + data.event);
          that.Sub_InputMethod_IME_Streamer_1000();
          break;
      }
    }

    let unSubscriberCallback = (err) =>  {
      console.info(TAG + '====>unSubscriberCallback start');
      if (err) {
        console.error(TAG + '====>unSubscriberCallback failed: ' + JSON.stringify(err));
      } else {
        console.info(TAG + '====>unSubscriberCallback finsh');
      }
    }  
  }

  public newArrayBuffer(str:string): ArrayBuffer {
    let arrayBuffer = new ArrayBuffer(str.length);
    const view = new Uint8Array(arrayBuffer);
    for(let i = 0; i < str.length; i++){
      view[i] = str.charCodeAt(i);
    }
    return arrayBuffer;
  }

  public GetArrayBufferString(buffer: ArrayBuffer): string {
    const decoder = util.TextDecoder.create('utf-8');
    const str = decoder.decodeWithStream(new Uint8Array(buffer));
    return str;
  }

  private start_on_sendMessage = (index: number): void =>{
    let that = this;
    console.info(`${TAG} ====>start_on_sendMessage index: ${index}`);
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(`${TAG} ====>start_on_sendMessage onTerminated`);
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(`${TAG} ====> onMessage msgId: ${msgId}`);
          that.SUB_inputMethod_IMF_setPreview(msgId);
        }
      };
      if (index === 500) {
        this.InputClient.recvMessage(msgHandler);
      } else {
        this.InputClient.recvMessage();
      };    
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      commoneventmanager.publish('start_on_sendMessage', commonEventPublishData, this.publishCallback); 
    } catch (err) {
      console.info(TAG + '====>receive start_on_sendMessage err:' + JSON.stringify(err));
      commoneventmanager.publish('start_on_sendMessage', commonEventPublishData, this.publishCallback);    
    }
  };

  private initWindow(): void {
    display.getDefaultDisplay().then(dis => {
      let dWidth = dis.width;
      let dHeight = dis.height;
      let keyHeightRate = 0.47;
      let keyHeight = dHeight * keyHeightRate;
      this.windowWidth = dWidth;
      this.windowHeight = keyHeight;
      this.nonBarPosition = dHeight - keyHeight

      let config = {
        name: this.windowName,
        windowType: windowManager.WindowType.TYPE_INPUT_METHOD,
        ctx: this.mContext
      };
      windowManager.createWindow(config).then((win) => {
        win.resize(dWidth, keyHeight).then(() => {
          win.moveWindowTo(0, this.nonBarPosition).then(() => {
            win.setUIContent('testability/pages/Second').then(() => {
            });
          });
        });
      });
    });
  }

  private publishCallback(err): void {
    if (err) {
      console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
    } else {
      console.log(TAG + '====>publish');
    }
  }

  private Sub_Misc_inputMethod_Panel_createPanelCallback_0010(): void {
    let commonEventPublishData;
    let panelInfo1 = {
      type: STATUS_BAR,
      flag: FLG_FLOATING
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 success');
    try {
      inputMethodAbility.createPanel(this.mContext, panelInfo1, async (err, panel) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 createPanel');
        if (err) {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 createPanel error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 Succeed in creating panel.' + JSON.stringify(panel));
        };
        await inputMethodAbility.destroyPanel(panel);
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_createPanelPromise_0020(): void {
    let commonEventPublishData;
    let panelInfo1 = {
      type: STATUS_BAR,
      flag: FLG_FLOATING
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 success');
    try {
      inputMethodAbility.createPanel(this.mContext, panelInfo1).then(async (panel) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 Succeed in creating panel.' + JSON.stringify(panel));
        await inputMethodAbility.destroyPanel(panel);
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 createPanel error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030(): Promise<void> {
    let commonEventPublishData;
    let panelInfo1 = {
      type: STATUS_BAR,
      flag: FLG_FIXED
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 success');
    try {
      let panel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
      inputMethodAbility.destroyPanel(panel, async (err, panel) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 destroyPanel');
        if (err) {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 destroyPanel error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 Succeed in destroying panel.' + JSON.stringify(panel));
        };
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040(): Promise<void> {
    let commonEventPublishData;
    let panelInfo1 = {
      type: STATUS_BAR,
      flag: FLG_FIXED
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 success');
    try {
      let panel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
      inputMethodAbility.destroyPanel(panel).then(async () => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 Succeed in destroyPanel panel.' + JSON.stringify(panel));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 destroyPanel error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0050(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.setUiContent('testability/pages/Second', async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 Succeed setUiContent: ' + JSON.stringify(data));
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0060(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.setUiContent('testability/pages/Second').then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 Succeed in setUiContent.' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 setUiContent error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0070(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.setUiContent('testability/pages/Second', this.storage, async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + 'Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 Succeed setUiContent: ' + JSON.stringify(data));
          }
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
        })
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0080(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.setUiContent('testability/pages/Second', this.storage).then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 Succeed in setUiContent: ' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 setUiContent error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizeCallback_0090(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.resize(this.windowWidth, this.windowHeight, async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 Succeeded in changing the panel size: ' + JSON.stringify(data));
          }
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
        })
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizePromise_0100(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.resize(this.windowWidth, this.windowHeight).then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0100 Succeed in changing the panel size: ' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 resize error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToCallback_0110(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.moveTo(100, 100, async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 Succeed in moving the panel: ' + JSON.stringify(data));
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToPromise_0120(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.moveTo(100, 100).then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 Succeed in moving the panel: ' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 moveTo error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_showCallback_0130(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.show(async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_showCallback_0130 Succeed in showing the panel: ' + JSON.stringify(data));
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_showPromise_0140(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.show().then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_showPromise_0140 Succeed in showing the panel: ' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 show error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_hideCallback_0150(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.hide(async (err, data) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide');
          if (err) {
            commonEventPublishData = {
              data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide error: ' + JSON.stringify(err));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
          } else {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_hideCallback_0150 Succeed in hiding the panel: ' + JSON.stringify(data));
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_hidePromise_0160(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.hide().then(async (data) => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_hidePromise_0160 Succeed in hiding the panel: ' + JSON.stringify(data));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
        }).catch(async (err) => {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 hide error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
        });
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onShow_0170(): Promise<void> {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel.off('show', ()=>{});
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 onShow error: ');
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onShow_0170 Succeed onShow: ');
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
        });
        await this.softKeyboardPanel.show();
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 this.softKeyboardPanel is null');
        commoneventmanager.publish('ub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onHide_0180(): Promise<void> {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('hide', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 onHide');
          this.softKeyboardPanel.off('hide', ()=>{});
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onHide_0180 Succeed onHide:');
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
        });
        await this.softKeyboardPanel.hide();
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_offShow_0190(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          this.softKeyboardPanel.off('show');
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 off Show count: ' + count);
        });
        let t1 = setInterval(async () => {
          await this.softKeyboardPanel.show();
          await this.softKeyboardPanel.hide();
          timeCount += 1;
          console.info(TAG + '====>this.softKeyboardPanel.show setInterval timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(t1);
          }
        }, 100);

        let t2 = setTimeout(() => {
          console.info(TAG + '====>setTimeout count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
          clearTimeout(t2);
        }, 500);

      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_offHide_0200(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('hide', async () => {
          this.softKeyboardPanel.off('hide');
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 off hide count: ' + count);
        });

        let t1 = setInterval(async () => {
          ;
          await this.softKeyboardPanel.show();
          await this.softKeyboardPanel.hide();
          timeCount += 1;
          console.info(TAG + '====>this.softKeyboardPanel.hide setInterval timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(t1);
          }
        }, 300);

        let t2 = setTimeout(() => {
          console.info(TAG + '====>setTimeout count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
          clearTimeout(t2);
        }, 1000);

      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_changeFlag_0210(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          this.softKeyboardPanel.changeFlag(1);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
        } catch (err) {
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0210 throw_error: ' + err);
        }

      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_changeFlag_0211(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let fla_fixed = inputmethodengine.PanelFlag.FLG_FIXED;
          let fla_floating = inputmethodengine.PanelFlag.FLG_FLOATING;
          this.softKeyboardPanel.changeFlag(fla_fixed);
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 switch to fla_fixed');
          this.softKeyboardPanel.changeFlag(fla_floating);
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
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_0600(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = true;
          this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 Failed to set privacy mode' + err);
          commonEventPublishData = {
            data: 'FAILED'
          };
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 this.softKeyboardPanel is null');
      }
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_0700(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = false;
          this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success switch to PrivacyMode');
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 Failed to set privacy mode' + err);
          commonEventPublishData = {
            data: 'FAILED'
          };
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 this.softKeyboardPanel is null');
      };
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_SecurityKeyboard_0800(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let isPrivacyMode: boolean = undefined;
          this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success switch to PrivacyMode');
        } catch (err) {
          console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 Failed to set privacy mode catch: ' + err);
          if (err.code === 401) {
            console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 Failed to set privacy mode002: ' + err);
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          }
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 this.softKeyboardPanel is null');
      };
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0800', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0800', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IMF_getSecurityMode_0100(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_InputMethod_IMF_getSecurityMode_0100 success');
    try {
      let mode1: inputmethodengine.SecurityMode = inputMethodAbility.getSecurityMode();
      if (mode1 === inputmethodengine.SecurityMode.BASIC || mode1 === inputmethodengine.SecurityMode.FULL) {
        console.info(TAG + '====>getSecurityMode, securityMode is : ${mode1}');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IMF_getSecurityMode_0100', commonEventPublishData, this.publishCallback);
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Failed to getSecurityMode: ${JSON.stringify(err)}');
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_InputMethod_IMF_getSecurityMode_0100 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IMF_getSecurityMode_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async SUB_InputMethod_IME_SplitScreen_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 start');
    try {
      if (this.softKeyboardPanel !== null) {
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 this.softKeyboardPanel:' + this.softKeyboardPanel);
        let t = setTimeout(async () => {
          clearTimeout(t);
          try {
            let WindowInfo = await this.InputClient.getCallingWindowInfo();
            console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo WindowInfo:' + JSON.stringify(WindowInfo));
            console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo  rect: ' + JSON.stringify(WindowInfo.rect));
            console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo  status: ' + JSON.stringify(WindowInfo.status));
            if (typeof (WindowInfo) === 'object' && typeof (WindowInfo.rect) === 'object' && typeof (WindowInfo.status) === 'number') {
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
          commoneventmanager.publish('SUB_InputMethod_IME_SplitScreen_0100', commonEventPublishData, this.publishCallback);

        }, 500);

      } else {
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 getCallingWindowInfo softKeyboardPanel is null ');
      };

    } catch (error) {
      console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 catch error: ' + JSON.stringify(error.message));
      console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0100 catch error: ' + JSON.stringify(error.code));
      commoneventmanager.publish('SUB_InputMethod_IME_SplitScreen_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_ScreenRotation_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ScreenRotation_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
        let keyboardRect: inputMethodEngine.PanelRect = {
            landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4},
            portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width}
        };
        this.softKeyboardPanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0100 startAbility success' );
    } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_ScreenRotation_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_ScreenRotation_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ScreenRotation_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try{
        let keyboardRect: inputMethodEngine.PanelRect = {
            landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4},
            portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width}
        };
        this.softKeyboardPanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0200 startAbility success' );
    } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_ScreenRotation_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_Misc_inputMethod_Panel_onSizeChange_0100(): Promise<void> {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('sizeChange', async (size, keyboardArea: inputMethodEngine.KeyboardArea) => {
          if (typeof (keyboardArea.top) === 'number' && typeof (keyboardArea.bottom) === 'number' && typeof (keyboardArea.left) === 'number' && typeof (keyboardArea.right) === 'number') {
            commonEventPublishData = {
                data: 'SUCCESS'
            };
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0100 onSizeChange');
          this.softKeyboardPanel.off('sizeChange', ()=>{});
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0100 offSizeChange');
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0100', commonEventPublishData, this.publishCallback);
        });
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 display_info.width1: ' + this.display_info.width);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 display_info.height1: ' + this.display_info.height);
        await this.softKeyboardPanel.resize(200, 100);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 display_info.width2: ' + this.display_info.width);
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0100 display_info.height2: ' + this.display_info.height);
      } else {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0100 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0100', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      commonEventPublishData = {
        data: 'FAILED'
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0100 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_onSizeChange_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let count = 0;
    let timeCount = 0;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 success');
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('sizeChange', async (size) => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 onSizeChange');
          this.softKeyboardPanel.off('sizeChange');
          count += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 off SizeChange count: ' + count);
        });
        let flage:boolean = true;
        let t1 = setInterval(async () => {
          if (flage === true) {
            flage = false;
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 display_info.width: ' + this.display_info.width);
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 display_info.height: ' + this.display_info.height);
            await this.softKeyboardPanel.resize(200, 120);
          } else {
            flage = true;
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 display_info.width: ' + this.display_info.width);
            console.info(TAG + '====>Sub_Misc_inputMethod_Panel_onSizeChange_0200 display_info.height: ' + this.display_info.height);
            await this.softKeyboardPanel.resize(200, 130);
          };
          timeCount += 1;
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 timeCount: ' + timeCount);
          if (timeCount === 2) {
            clearInterval(t1);
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 clearInterval success');
          };
        }, 100);

        let t2 = setTimeout(() => {
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 count: ' + count);
          if (count === 1) {
            commonEventPublishData = {
              data: 'SUCCESS'
            };
          };
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0200', commonEventPublishData, this.publishCallback);
          clearTimeout(t2);
        }, 500);

      } else {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 this.softKeyboardPanel is null');
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0200', commonEventPublishData, this.publishCallback);
      };
    } catch (error) {
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onSizeChange_0200 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onSizeChange_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IME_Dragging_1100(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let fla_fixed = inputmethodengine.PanelFlag.FLG_FIXED;
    let fla_floating = inputmethodengine.PanelFlag.FLG_FLOATING;
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          this.softKeyboardPanel.changeFlag(fla_fixed);
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 switch to fla_fixed');
          this.softKeyboardPanel.startMoving();
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
          this.softKeyboardPanel.changeFlag(fla_floating);
        };
      } else {
        console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 this.softKeyboardPanel is null');
      };
      commoneventmanager.publish('Sub_InputMethod_IME_Dragging_1100', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_1100 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IME_Dragging_1100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Dragging_0800(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 success');
    try {
      if (this.softKeyboardPanel !== null) {
        try {
          let num = await this.softKeyboardPanel.getDisplayId();
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
      commoneventmanager.publish('Sub_InputMethod_IME_Dragging_0800', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0800 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IME_Dragging_0800', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Dragging_0900(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 success');
    try {
      let panelInfo: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
        flag: inputMethodEngine.PanelFlag.FLG_FLOATING
      };
      inputMethodAbility.createPanel(this.mContext, panelInfo).then(async(inputPanel: inputMethodEngine.Panel) => {
        if (inputPanel) {
          let wid = Math.floor(this.display_info.width * 0.4);
          let hei = Math.floor(this.display_info.height * 0.5);
          console.info(TAG + `====>Sub_InputMethod_IME_Dragging_0900 wid: ${wid},hei: ${hei}`);
          await inputPanel.resize(wid, hei);
          let wid_ = Math.floor(this.display_info.width * 0.3);
          let hei_ = Math.floor(this.display_info.height * 0.4);
          console.info(TAG + `====>Sub_InputMethod_IME_Dragging_0900 wid_: ${wid_},hei_: ${hei_}`);
          await inputPanel.moveTo(wid_, hei_);
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 creat panel success!');
          let displayId = await inputPanel.getDisplayId();
          console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 getDisplayId success!');
          commonEventPublishData = {
            data: typeof displayId
          };
        };
        await inputMethodAbility.destroyPanel(inputPanel);
        commoneventmanager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
      }).catch((err) => {
        console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 creat panel throw err: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Dragging_0900 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_InputMethod_IME_Dragging_0900', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_InputMethod_IME_Custom_0900(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 onTerminated');
        },
        onMessage(msgId: string): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 onMessage msgId: ' + msgId );
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 sedMessages msgIdSize: ' + msgId.length );
          if (msgId === 'Sub_InputMethod_IME_Custom_0900') {
            console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 start sendMessage');
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0900', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0900', that.newArrayBuffer('FAILED'));
          };
          that.InputClient.recvMessage();
        }
      };
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0900 recvMessage catch err!');
    };
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0900', commonEventPublishData, this.publishCallback);
    }, 100);
  }

  private Sub_InputMethod_IME_Custom_0200(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 onTerminated');
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 onMessage msgId: ' + msgId + ', msgParam: ' +
          that.GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 sedMessages msgIdSize: ' + msgId.length + ', msgParamSize: ' +
            that.GetArrayBufferString(msgParam)?.length + ', ArrayBufferSize' + msgParam?.byteLength);
          if (msgId.length === 256 && msgParam?.byteLength === 131072) {
            console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 start sendMessage');
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0200', that.newArrayBuffer('SUCCESS'));
          } else {
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0200', that.newArrayBuffer('FAILED'));
          }
          that.InputClient.recvMessage();
        }
      };
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0200 recvMessage catch err!');
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0200', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private Sub_InputMethod_IME_Custom_0800(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0800 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0800 onTerminated');
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0800 onMessage msgId: ' + msgId + ', msgParam: ' +
          that.GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0800 sedMessages msgIdSize: ' + msgId.length + ', msgParamSize: ' +
            that.GetArrayBufferString(msgParam)?.length + ', ArrayBufferSize' +  msgParam?.byteLength);
          if (msgId.length === 0 && msgParam?.byteLength === 131072) {
            console.info(TAG + '====>Sub_InputMethod_IME_Custom_0800 start sendMessage');
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0800', that.newArrayBuffer('SUCCESS'))
          }else{
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_0800', that.newArrayBuffer('FAILED'))
          }
          that.InputClient.recvMessage()
        }
      }
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG +'====>Sub_InputMethod_IME_Custom_0800 recvMessage catch err!');
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0800', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private Sub_InputMethod_IME_Custom_0400(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0400 onTerminated');
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0400 onMessage msgId: ' + msgId + ', msgParam: ' +
          that.GetArrayBufferString(msgParam) );
          that.InputClient.recvMessage()
        }
      }
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG +'====>Sub_InputMethod_IME_Custom_0400 recvMessage catch err!');
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0400', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private Sub_InputMethod_IME_Custom_0300(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0300 onTerminated');
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_0300 onMessage msgId: ' + msgId + ', msgParam: ' +
          that.GetArrayBufferString(msgParam) );
          that.InputClient.recvMessage()
        }
      }
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0300 recvMessage catch err!');
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0300', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private Sub_InputMethod_IME_Custom_1100(): void {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_1100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let that = this;
      let msgHandler: inputMethodEngine.MessageHandler = {
        onTerminated(): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_1100 onTerminated');
        },
        onMessage(msgId: string, msgParam?: ArrayBuffer): void {
          console.info(TAG + '====>Sub_InputMethod_IME_Custom_1100 onMessage msgId: ' + msgId + ', msgParam: ' +
          that.GetArrayBufferString(msgParam) + ', msgParamObj' + msgParam);
          if(msgId.length === 256 && msgParam?.byteLength === undefined) {
            console.info(TAG + '====>Sub_InputMethod_IME_Custom_1100 start sendMessage');
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_1100')
          }else{
            that.InputClient.sendMessage('Sub_InputMethod_IME_Custom_1100', that.newArrayBuffer('FAILED'))
          }
          that.InputClient.recvMessage()
        }
      }
      this.InputClient.recvMessage(msgHandler);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (error) {
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_1100 recvMessage catch err!');
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_1100', commonEventPublishData, this.publishCallback);
    }, 100)
  }

  private async Sub_InputMethod_IME_Attach_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Attach_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
        inputMethodAbility.off('inputStart');
        this.keyboardController = keyboardController;
        this.InputClient = InputClient;

        console.info(TAG + '====>Sub_InputMethod_IME_Attach_0100 inputMethonAbility inputStart into');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_Attach_0100', commonEventPublishData, this.publishCallback);
      })
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_Attach_0100', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Attach_0100 err: ' + JSON.stringify(err));
    }
  }

  private async Sub_InputMethod_IME_Attach_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Attach_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
        inputMethodAbility.off('inputStart');
        this.keyboardController = keyboardController;
        this.InputClient = InputClient;

        console.info(TAG + '====>Sub_InputMethod_IME_Attach_0200 inputMethonAbility inputStart into');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_Attach_0200', commonEventPublishData, this.publishCallback);
      })
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_Attach_0200', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Attach_0200 err: ' + JSON.stringify(err));
    }
  }

  private async Sub_InputMethod_IME_Attach_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Attach_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
        inputMethodAbility.off('inputStart');
        this.keyboardController = keyboardController;
        this.InputClient = InputClient;

        console.info(TAG + '====>Sub_InputMethod_IME_Attach_0300 inputMethonAbility inputStart into');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_Attach_0300', commonEventPublishData, this.publishCallback);
      })
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_Attach_0300', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Attach_0300 err: ' + JSON.stringify(err));
    }
  }

  private async Sub_InputMethod_IME_Attach_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Attach_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
        inputMethodAbility.off('inputStart');
        this.keyboardController = keyboardController;
        this.InputClient = InputClient;

        console.info(TAG + '====>Sub_InputMethod_IME_Attach_0400 inputMethonAbility inputStart into');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_Attach_0400', commonEventPublishData, this.publishCallback);
      })
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_Attach_0400', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Attach_0400 err: ' + JSON.stringify(err));
    }
  }

  private async Sub_InputMethod_IME_ShowTextInput_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel.off('show');
          console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0100 onShow error: ');
          console.info(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0100 Succeed onShow: ');
          commoneventmanager.publish(
            'Sub_InputMethod_IME_ShowTextInput_0100', commonEventPublishData, this.publishCallback);
        });
      }
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_ShowTextInput_0100', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private async Sub_InputMethod_IME_ShowTextInput_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel.off('show');
          console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0200 onShow error: ');
          console.info(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0200 Succeed onShow: ');
          commoneventmanager.publish(
            'Sub_InputMethod_IME_ShowTextInput_0200', commonEventPublishData, this.publishCallback);
        });
      }
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_ShowTextInput_0200', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private async Sub_InputMethod_IME_ShowTextInput_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel.off('show');
          console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0300 onShow error: ');
          console.info(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0300 Succeed onShow: ');
          commoneventmanager.publish(
            'Sub_InputMethod_IME_ShowTextInput_0300', commonEventPublishData, this.publishCallback);
        });
      }
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_ShowTextInput_0300', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0300 catch error: ' + JSON.stringify(error));
    }
  }

  private async Sub_InputMethod_IME_ShowTextInput_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        this.softKeyboardPanel.on('show', async () => {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          this.softKeyboardPanel.off('show');
          console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0400 onShow error: ');
          console.info(TAG + '====>Sub_InputMethod_IME_ShowTextInput_0400 Succeed onShow: ');
          commoneventmanager.publish(
            'Sub_InputMethod_IME_ShowTextInput_0400', commonEventPublishData, this.publishCallback);
        });
      }
      commonEventPublishData = {
        data: 'on_SUCCESS'
      };
      commoneventmanager.publish('Sub_InputMethod_IME_ShowTextInput_0400', commonEventPublishData, this.publishCallback);
    } catch (error) {
      console.info(TAG + '====>receive Sub_InputMethod_IME_ShowTextInput_0400 catch error: ' + JSON.stringify(error));
    }
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        portraitRect: { left: 0, top: 0, width: this.display_info.width, height: this.display_info.height*0.5},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1960,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0100 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0100 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0100', commonEventPublishData, this.publishCallback);
  } 

  private async Sub_InputMethod_IME_FullScreenAbnormal_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 0, width: this.display_info.height, height: this.display_info.width * 0.5},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:false
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0200 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0200 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0200 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0200', commonEventPublishData, this.publishCallback);
  } 

  private async Sub_InputMethod_IME_FullScreenAbnormal_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 3000, width: this.display_info.height + 2000, height: this.display_info.width + 2000},
        portraitRect: { left: 0, top: 3000, width: this.display_info.width + 2000, height: this.display_info.height + 2000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:false
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0500 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0500 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0500 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0500', commonEventPublishData, this.publishCallback);
  } 

  private async Sub_InputMethod_IME_FullScreenAbnormal_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0400 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}, { left: 0, top: 247, width: this.display_info.height, height: 150}, { left: 0, top: 247, width: this.display_info.height, height: 150}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:true
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0400 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0400 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0400 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0400', commonEventPublishData, this.publishCallback);
  } 

  private async Sub_InputMethod_IME_FullScreenAbnormal_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 800, width: 300, height: 800},
        landscapeAvoidY: 500,
        landscapeInputRegion:[],
        portraitAvoidY: 1950,
        portraitInputRegion: [],
        fullScreenMode:true
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0300 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0300 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0300 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0300', commonEventPublishData, this.publishCallback);
  } 

  private async Sub_InputMethod_IME_FullScreenAbnormal_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_1200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:true
      };
      this.softKeyboardPanel.adjustPanelRect(2, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1200 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1200 cathch err: ' + JSON.stringify(err));
      if (err.code === 12800017) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1200 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0700 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: this.display_info.width},
        portraitRect: { left: 0, top: 1500, width: 300, height: this.display_info.height},
        landscapeAvoidY: 20,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 20,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:false
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0700 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0700 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0700 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0600 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 2100},
        landscapeAvoidY: 20,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 20,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}, { left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:true
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0600 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0600 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0600 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0800 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: -1,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}],
        portraitAvoidY: -1,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}],
        fullScreenMode:true
      };
      this.softKeyboardPanel.adjustPanelRect(1, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0800 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0800 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0800 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0800', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_0900 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: -1,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}],
        portraitAvoidY: -1,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}],
        fullScreenMode:false
      };
      this.softKeyboardPanel.adjustPanelRect(1, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0900 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0900 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_0900 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_0900', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_1000 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300},
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}, { left: 0, top: 247, width: this.display_info.height, height: 150}],
        portraitAvoidY: 1200,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760},{ left: 0, top: 1695, width: this.display_info.width, height: 150}],
        fullScreenMode:false
      };
      this.softKeyboardPanel.adjustPanelRect(0, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1000 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1000 cathch err: ' + JSON.stringify(err));
      if (err.code === 401) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1000 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.changeFlag(2)
      this.softKeyboardPanel.updateRegion([{ left: 320, top: 650, width: this.display_info.width, height: 500}]);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 cathch err: ' + JSON.stringify(err));
      if (err.code === 12800017) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0200 Failed to adjustPanelRect err is ' + err);
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        this.softKeyboardPanel.changeFlag(0);
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenUR_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updateRegion([]);
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
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenUR_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0400 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try{
      this.softKeyboardPanel.updateRegion([{ left: 320, top: 650, width: this.display_info.width, height: 500}, { left: 320, top: 650, width: this.display_info.width, height: 500}, { left: 320, top: 650, width: this.display_info.width, height: 500}, { left: 320, top: 650, width: this.display_info.width, height: 500}, { left: 320, top: 650, width: this.display_info.width, height: 500}]);
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
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenUR_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0700 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updateRegion([{ left: -1, top: -1, width: this.display_info.width + 3000, height: this.display_info.height + 3000}]);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0700 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0700 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenUR_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenAbnormal_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenAbnormal_1100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try{
      let panelInfo1:inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 creatPanel Succeed.');
      let enhancedPanelRect:inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 500},
        portraitRect: { left: 0, top: 1500, width: 300, height: 300},
        landscapeAvoidY: 500,
        landscapeInputRegion:[{ left: 0, top: 500, width: this.display_info.height, height: 600}],
        portraitAvoidY: 1000,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760}],
        fullScreenMode:true
      };
      try {
        inputPanel.adjustPanelRect(0, enhancedPanelRect);
      } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 cathch err: ' + err);
        if (err.code === 12800017) {
          console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 Failed to adjustPanelRect err is ' + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          await inputMethodAbility.destroyPanel(inputPanel);
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenAbnormal_1100 cathch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenAbnormal_1100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_FullScreenUR_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_FullScreenUR_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let panelInfo1:inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel =  await inputMethodAbility.createPanel(this.mContext,panelInfo1);
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 creatPanel Succeed.');
      try{
        inputPanel.updateRegion([{ left: this.display_info.width*0.3, top: this.display_info.height * 0.5, width: this.display_info.width, height: this.display_info.height * 0.5}]);
      } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 cathch err: ' + err);
        if (err.code === 12800017) {
          console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 Failed to adjustPanelRect err is ' + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          await inputMethodAbility.destroyPanel(inputPanel);
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_FullScreenUR_0100 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_FullScreenUR_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_0900 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE);
      let mode = this.softKeyboardPanel.getImmersiveMode();
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0900 ImmersiveMode :' + JSON.stringify(mode));
      if (mode == 0) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0900 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0900 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Immersive_0900', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_1000 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let mode = this.softKeyboardPanel.getImmersiveMode();
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1000 ImmersiveMode :' + JSON.stringify(mode));
      if (mode == 2) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1000 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1000 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Immersive_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_1100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.DARK_IMMERSIVE);
      let mode = this.softKeyboardPanel.getImmersiveMode();
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1100 ImmersiveMode :' + JSON.stringify(mode));
      if (mode == 3) {
        commonEventPublishData = {
          data: 'SUCCESS'
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1100 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Immersive_1100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Immersive_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_1200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    inputmethodengine.getKeyboardDelegate().on('editorAttributeChanged', (attr:inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)} immersiveMode = ${attr.immersiveMode}   gradientMode = ${attr.gradientMode}`); 
      this.immersive = attr.immersiveMode;
      inputmethodengine.getKeyboardDelegate().off('editorAttributeChanged');
    });
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.immersive;
        console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1200 ImmersiveMode :' + JSON.stringify(mode));
        if (mode == 2) {
          commonEventPublishData = {
            data: 'SUCCESS'
          }
        };
        console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1200 success ');
        commoneventmanager.publish('Sub_InputMethod_IME_Immersive_1200', commonEventPublishData, this.publishCallback);
      }, 500)
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_1200 cathch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_Immersive_1200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_Immersive_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      try {
        this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.IMMERSIVE);
      } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0500 setImmersiveMode err: ' + JSON.stringify(err));
        if (err.code === 401) {
          console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0500 setImmersiveMode err: ' + err);
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
      };
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0500 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0500 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Immersive_0500', commonEventPublishData, this.publishCallback);
  }

  private Sub_Misc_inputMethod_Panel_createPanelCallback_0011(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0011 success');
    try {
      inputMethodAbility.createPanel(this.mContext, undefined, async (err, panel) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0011 createPanel');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0011 createPanel error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0011', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelCallback_0011 Succeed in creating panel.' + JSON.stringify(panel));
        }
        await inputMethodAbility.destroyPanel(panel);
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0011', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0011 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0011', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_createPanelPromise_0021(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0021 success');
    try {
      inputMethodAbility.createPanel(this.mContext, undefined).then(async (panel) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelPromise_0021 Succeed in creating panel.' + JSON.stringify(panel));
        await inputMethodAbility.destroyPanel(panel);
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0021', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0021 createPanel error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0021', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0021 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0021', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031(): Promise<void> {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 success');
    try {
      inputMethodAbility.destroyPanel(undefined, async (err, panel) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 destroyPanel');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 destroyPanel error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 Succeed in destroying panel.' + JSON.stringify(panel));
        };
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0031', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041(): Promise<void> {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 success');
    try {
      let panel = await inputMethodAbility.createPanel(this.mContext, undefined);
      inputMethodAbility.destroyPanel(panel).then(async () => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 Succeed in destroyPanel panel.' + JSON.stringify(panel));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 destroyPanel error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0041', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0051(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 success');
    try {
      this.softKeyboardPanel.setUiContent(undefined, async (err, data) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 setUiContent');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 setUiContent error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0051', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 Succeed setUiContent: ' + JSON.stringify(data));
        };
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0051', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0051 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0051', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0061(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 success');
    try {
      this.softKeyboardPanel.setUiContent(undefined).then(async (data) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 Succeed in setUiContent.' + JSON.stringify(data));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0061', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 setUiContent error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0061', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0061 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0061', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentCallback_0071(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 success');
    try {
      this.softKeyboardPanel.setUiContent(undefined, this.storage, async (err, data) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 setUiContent');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 setUiContent error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0071', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + 'Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 Succeed setUiContent: ' + JSON.stringify(data));
        };
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0071', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0071 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0071', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_setUiContentPromise_0081(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 success');
    try {
      this.softKeyboardPanel.setUiContent(undefined, this.storage).then(async (data) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 Succeed in setUiContent: ' + JSON.stringify(data));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0081', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 setUiContent error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0081', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0081 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0081', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizeCallback_0091(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0091 success');
    try {
      this.softKeyboardPanel.resize(undefined, undefined, async (err, data) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0091 resize');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0091 resize error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0091', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0091 Succeeded in changing the panel size: ' + JSON.stringify(data));
        }
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0091', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0091 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0091', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_resizePromise_0101(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0101 success');
    try {
      this.softKeyboardPanel.resize(undefined, undefined).then(async (data) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0101 Succeed in changing the panel size: ' + JSON.stringify(data));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0101', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0101 resize error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0101', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0101 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0101', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToCallback_0111(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0111 success');
    try {
      this.softKeyboardPanel.moveTo(undefined, undefined, async (err, data) => {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0111 moveTo');
        if (err) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
          console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0111 moveTo error: ' + JSON.stringify(err));
          commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0111', commonEventPublishData, this.publishCallback);
        } else {
          commonEventPublishData = {
            data: 'FAILED'
          };
          console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0111 Succeed in moving the panel: ' + JSON.stringify(data));
        }
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0111', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0111 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0111', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_moveToPromise_0121(): void {
    let commonEventPublishData;
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0121 success');
    try {
      this.softKeyboardPanel.moveTo(undefined, undefined).then(async (data) => {
        commonEventPublishData = {
          data: 'FAILED'
        };
        console.info(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0121 Succeed in moving the panel: ' + JSON.stringify(data));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0121', commonEventPublishData, this.publishCallback);
      }).catch(async (err) => {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0121 moveTo error: ' + JSON.stringify(err));
        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0121', commonEventPublishData, this.publishCallback);
      });
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0121 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0121', commonEventPublishData, this.publishCallback);
    }
  }

  private Sub_Misc_inputMethod_Panel_changeFlag_0212(): void {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0212 start');
    try {
      this.softKeyboardPanel.changeFlag(undefined);
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0212 success');
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0212', commonEventPublishData, this.publishCallback);
    } catch (error) {
      if (error.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0212 catch error: ' + JSON.stringify(error));
      commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0212', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_ScreenRotation_0101(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_ScreenRotation_0101 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
          landscapeRect: { left: 100, top: 100, width: this.display_info.width * 10, height: this.display_info.height * 10},
          portraitRect: { left: 100, top: 100, width: this.display_info.height * 10, height: this.display_info.width * 10}
      };
      this.softKeyboardPanel.adjustPanelRect(undefined, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0101 startAbility success' );
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_ScreenRotation_0101 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_ScreenRotation_0101', commonEventPublishData, this.publishCallback);
  }

  private async SUB_InputMethod_IsTextPreviewSupport_0101(): Promise<void> {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0101 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputMethodEngine.Range = { start: 0, end: 1 };
      await this.InputClient.setPreviewText('adc|03', range);
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0101 setPreviewText success:');
      commonEventPublishData = {
        data: 'FAILED'

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0101 setPreviewText catch err: ' +
      JSON.stringify(err));
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('SUB_InputMethod_IsTextPreviewSupport_0101', commonEventPublishData,
      this.publishCallback);
  }

  private async SUB_InputMethod_IsTextPreviewSupport_0201(): Promise<void> {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0201 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputMethodEngine.Range = { start: 0, end: 1 };
      await this.InputClient.setPreviewTextSync('adc|03', range);
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0201 setPreviewText success:');
      commonEventPublishData = {
        data: 'FAILED'

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0201 setPreviewText catch err: ' +
      JSON.stringify(err));
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('SUB_InputMethod_IsTextPreviewSupport_0201', commonEventPublishData,
      this.publishCallback);
  }

  private async SUB_InputMethod_IsTextPreviewSupport_0301(): Promise<void> {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0301 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.finishTextPreview();
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0301 setPreviewText success:');
      commonEventPublishData = {
        data: 'FAILED'

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0301 setPreviewText catch err: ' +
      JSON.stringify(err));
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('SUB_InputMethod_IsTextPreviewSupport_0301', commonEventPublishData,
      this.publishCallback);
  }

  private async SUB_InputMethod_IsTextPreviewSupport_0401(): Promise<void> {
    console.info(TAG + '====>receive SUB_InputMethod_IsTextPreviewSupport_0401 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.finishTextPreviewSync();
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0401 setPreviewText success:');
      commonEventPublishData = {
        data: 'FAILED'

      };
    } catch (err) {
      console.info(TAG + '====>SUB_InputMethod_IsTextPreviewSupport_0401 setPreviewText catch err: ' +
      JSON.stringify(err));
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('SUB_InputMethod_IsTextPreviewSupport_0401', commonEventPublishData,
      this.publishCallback);
  }

  private async SUB_InputMethod_IME_SplitScreen_0101(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 start');
    try {
      if (this.softKeyboardPanel !== null) {
        await inputMethodAbility.destroyPanel(this.softKeyboardPanel);
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 this.softKeyboardPanel:' + this.softKeyboardPanel);
          try {
            let WindowInfo = await this.InputClient.getCallingWindowInfo();
            console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 getCallingWindowInfo WindowInfo:  success');
          } catch (err) {
            console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 getCallingWindowInfO err: ' + JSON.stringify(err.code) + err);
            if (err.code === 12800012) {
              commonEventPublishData = {
                data: 'SUCCESS'
              };
            }
          };
          commoneventmanager.publish('SUB_InputMethod_IME_SplitScreen_0101', commonEventPublishData, this.publishCallback);
      } else {
        console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 getCallingWindowInfo softKeyboardPanel is null ');
      };
    } catch (error) {
      console.info(TAG + '====>SUB_InputMethod_IME_SplitScreen_0101 catch error: ' + JSON.stringify(error.code) + JSON.stringify(error.message));
      commoneventmanager.publish('SUB_InputMethod_IME_SplitScreen_0101', commonEventPublishData, this.publishCallback);
    }
  } 

  private async SUB_inputMethod_IMF_setPreview(testCaseName: string): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.setPreviewTextSync(`${testCaseName}`, {start:0, end: 1});
      this.InputClient.finishTextPreviewSync();
    } catch (err) {
      console.info(TAG + `====>receive ${testCaseName} err: ${err.code}`);
      if (err.code === 12800011) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish(`${testCaseName}`, commonEventPublishData, this.publishCallback);   
    }
  }

  private async Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    inputmethodengine.getKeyboardDelegate().on('editorAttributeChanged', (attr:inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)}`); 
      if (typeof (attr.windowId) === 'number' && typeof (attr.displayId) === 'number') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      inputmethodengine.getKeyboardDelegate().off('editorAttributeChanged');
      commoneventmanager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100', commonEventPublishData, this.publishCallback);
    });
    try {
      let callingDisplayDidChangeCallback = (num: number): void => {
        console.info(TAG + `====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 display id: ${num}`);
      };
      inputMethodEngine.getInputMethodAbility().on('callingDisplayDidChange', callingDisplayDidChangeCallback);
      inputMethodEngine.getInputMethodAbility().off('callingDisplayDidChange', callingDisplayDidChangeCallback);
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100 cathch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let callingDisplayDidChangeCallback1 = (num: number): void => {
        console.info(TAG + `====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 display id: ${num}`);
      };
      inputMethodEngine.getInputMethodAbility().on('callingDisplayDidChange', callingDisplayDidChangeCallback1);
      inputMethodEngine.getInputMethodAbility().off('callingDisplayDidChange');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 success ');
      commoneventmanager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200', commonEventPublishData, this.publishCallback);
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200 cathch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IMF_onoffcallingDisplayDidChange_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0100 ImmersiveMode :' + JSON.stringify(effect));
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0100 success ');
    } catch (err) {
      if (err.code === 801) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0100 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setImmersiveEffect_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 1,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0200 effect :' + JSON.stringify(effect));
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
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0200 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setImmersiveEffect_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0300 effect :' + JSON.stringify(effect));
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
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0300 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setImmersiveEffect_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0400 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.BACKGROUND_FLUID_LIGHT 
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
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
    commoneventmanager.publish('Sub_InputMethod_IME_setImmersiveEffect_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setImmersiveEffect_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 1,
        gradientMode: inputMethodEngine.GradientMode.LINEAR_GRADIENT,
        fluidLightMode: inputMethodEngine.FluidLightMode.NONE 
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
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
      console.info(TAG + '====>Sub_InputMethod_IME_setImmersiveEffect_0500 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setImmersiveEffect_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: inputMethodEngine.GradientMode.NONE,
        fluidLightMode: inputMethodEngine.FluidLightMode.BACKGROUND_FLUID_LIGHT
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
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
    commoneventmanager.publish('Sub_InputMethod_IME_Streamer_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: 0,
        gradientMode: 1
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
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
      console.info(TAG + '====>Sub_InputMethod_IME_Streamer_0500 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Streamer_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Streamer_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Streamer_1000 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let Height = (this.display_info.height > this.display_info.width ? this.display_info.height : this.display_info.width) * 0.15 + 1;
      this.softKeyboardPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
      let effect: inputMethodEngine.ImmersiveEffect = {
        gradientHeight: Height,
        gradientMode: 1
      };
      this.softKeyboardPanel.setImmersiveEffect(effect);
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
    commoneventmanager.publish('Sub_InputMethod_IME_Streamer_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setImmersiveEffect_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let attachOptions: inputMethodEngine.AttachOptions = this.InputClient.getAttachOptions();
      console.info(TAG + '====>Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100 attachOptions is' + JSON.stringify(attachOptions));
      if (attachOptions.isSimpleKeyboardEnabled === false) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      };
      console.info(TAG + '====>Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_isSimpleKeyboardEnabled_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setKeepScreenOn_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setKeepScreenOn_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    let panelInfo1:inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
    };
    let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
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
      await inputMethodAbility.destroyPanel(inputPanel);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setKeepScreenOn_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setKeepScreenOn_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setKeepScreenOn_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    let panelInfo1:inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
    };
    let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
    try {
      let isKeepScreenOn = false;
      await inputPanel.setKeepScreenOn(isKeepScreenOn);
      commonEventPublishData = {
          data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0200 success ');
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_setKeepScreenOn_0200 cathch err: ' + JSON.stringify(err));
    } finally {
      await inputMethodAbility.destroyPanel(inputPanel);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setKeepScreenOn_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_Custom_0901(): Promise<void> {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0901 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMsgId';
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient.sendMessage(msgId, msgParam);
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0901 recvMessage success');
    } catch (error) {
      if (error.code === 12800016) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0901 recvMessage catch err!: ' + error.code);
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0901', commonEventPublishData, this.publishCallback);
    }, 100);
  }

  private async Sub_InputMethod_IME_Custom_0902(): Promise<void> {
    console.info(TAG + '====>Sub_InputMethod_IME_Custom_0902 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMsgId';
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      await this.InputClient.sendMessage(msgId, msgParam);
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0902 recvMessage success');
    } catch (error) {
      if (error.code === 12800015) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_Custom_0902 recvMessage catch err!: ' + error.code);
    }
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish('Sub_InputMethod_IME_Custom_0902', commonEventPublishData, this.publishCallback);
    }, 100);
  }

  private async Sub_InputMethod_IME_Immersive_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_Immersive_0600 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);

      try {
        inputPanel.setImmersiveMode(inputMethodEngine.ImmersiveMode.LIGHT_IMMERSIVE);
        let effect: inputMethodEngine.ImmersiveEffect = {
          gradientHeight:1,
          gradientMode:inputMethodEngine.GradientMode.LINEAR_GRADIENT,
          fluidLightMode:inputMethodEngine.FluidLightMode.NONE
        };
        inputPanel.setImmersiveEffect(effect);
        console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0600 setImmersiveMode  success ');
      } catch (err) {
        console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0600 setImmersiveMode err: ' + err.code + JSON.stringify(err));
        await inputMethodAbility.destroyPanel(inputPanel);
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
      console.info(TAG + '====>Sub_InputMethod_IME_Immersive_0600 cathch err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_Immersive_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_OffsetArea_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    }; 
    try {
      let fla_fixed = inputmethodengine.PanelFlag.FLG_FIXED;
      let displayId = await this.softKeyboardPanel.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      await this.softKeyboardPanel.changeFlag(fla_fixed);
      console.info(TAG + '====>Sub_InputMethod_IME_OffsetArea_0100 changeFlag  success ');
      let SystemPanelInsets = await this.softKeyboardPanel.getSystemPanelCurrentInsets(displayId);
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_0100 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets.left}, right:  ${SystemPanelInsets.right}, bottom:  ${SystemPanelInsets.bottom}}`);
      if (typeof(SystemPanelInsets.left) === 'number' && typeof(SystemPanelInsets.right) === 'number' && typeof(SystemPanelInsets.bottom) === 'number') {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_0100 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    } finally {
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_0100 getSystemPanelCurrentInsets end`);
      commoneventmanager.publish('Sub_InputMethod_IME_OffsetArea_0100', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_OffsetArea_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let SystemPanelInsets = await this.softKeyboardPanel.getSystemPanelCurrentInsets(1008611);
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1200 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets.left}, right:  ${SystemPanelInsets.right}, bottom:  ${SystemPanelInsets.bottom}}`);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1200 cathch err.code: ${err.code}  , err.message: ${err.message}`);
      if (err.code === 12800022) {
        commonEventPublishData = {
            data: 'SUCCESS'
          };
      }
    } finally {
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1200 getSystemPanelCurrentInsets end`);
      commoneventmanager.publish('Sub_InputMethod_IME_OffsetArea_1200', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_OffsetArea_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1000 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      if (this.softKeyboardPanel !== null) {
        await inputMethodAbility.destroyPanel(this.softKeyboardPanel);
      } else {
        console.info(TAG + '====>Sub_InputMethod_IME_OffsetArea_1000 this.softKeyboardPanel is null');
      };
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
        flag: inputMethodEngine.PanelFlag.FLAG_CANDIDATE
      };
      let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 createPanel success`);
      let displayId = await inputPanel.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      try {
        let SystemPanelInsets = await inputPanel.getSystemPanelCurrentInsets(displayId);
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets.left}, right:  ${SystemPanelInsets.right}, bottom:  ${SystemPanelInsets.bottom}}`);
      } catch (err) {
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets cathch err.code: ${err.code}  , err.message: ${err.message}`);
        if (err.code === 12800017) {
          commonEventPublishData = {
              data: 'SUCCESS'
            };
        }
      } finally {
        await inputMethodAbility.destroyPanel(inputPanel);
        console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 getSystemPanelCurrentInsets end`);
      };
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1000 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_OffsetArea_1000', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_OffsetArea_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_OffsetArea_1100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let panelInfo1: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.STATUS_BAR,
      };
      let inputPanel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
      console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1000 createPanel success`);
      let displayId = await inputPanel.getDisplayId();
      console.info(TAG + `====>Panel.getDisplayId success. displayId: ${displayId}`);
      try {
        let SystemPanelInsets = await inputPanel.getSystemPanelCurrentInsets(displayId);
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets success. insets is{left:  ${SystemPanelInsets.left}, right:  ${SystemPanelInsets.right}, bottom:  ${SystemPanelInsets.bottom}}`);
      } catch (err) {
        console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets cathch err.code: ${err.code}  , err.message: ${err.message}`);
        if (err.code === 12800017) {
          commonEventPublishData = {
              data: 'SUCCESS'
            };
        }
      } finally {
        await inputMethodAbility.destroyPanel(inputPanel);
        console.info(TAG + `====>Panel.Sub_InputMethod_IME_OffsetArea_1100 getSystemPanelCurrentInsets end`);
      };
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_OffsetArea_1100 cathch err.code: ${err.code}  , err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_OffsetArea_1100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#01000000', '#01000000');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0100 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0100 cathch err.code: ${err.code} err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#000000', '#FFFFFF');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0200 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0200 cathch err.code: ${err.code} err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor(undefined, '#FFFFFFFF');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0300 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0300 cathch err.code: ${err.code} err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0400 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#FFFFFFFF', undefined);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0400 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0400 cathch err.code: ${err.code} err.message: ${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#FFFFFFFF', '#00xxxxxx');
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0500 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0500 cathch err.code: ${err.code} err.message: ${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_setSystemPanelButtonColor_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_setSystemPanelButtonColor_0600 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#00xxxxxx', '#FFFFFFFF');
      console.info(TAG + '====>Sub_InputMethod_IME_setSystemPanelButtonColor_0600 success ');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_setSystemPanelButtonColor_0600 cathch err.code: ${err.code} err.message: ${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_setSystemPanelButtonColor_0600', commonEventPublishData, this.publishCallback);
  }

}