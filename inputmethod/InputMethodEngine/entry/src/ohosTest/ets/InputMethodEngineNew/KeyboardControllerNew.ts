/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import prompt from '@ohos.prompt';
import inputmethodengine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commoneventmanager from '@ohos.commonEventManager';


let inputKeyboardDelegate = inputmethodengine.getKeyboardDelegate();
let inputMethodAbility = inputmethodengine.getInputMethodAbility();
let inputMethodEngine = inputmethodengine.getInputMethodEngine();
const TAG = 'keyboardControllerNew';

export class KeyboardControllerNew {
  mContext;
  WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
  windowName = 'inputApp';
  private windowHeight: number = 0;
  private windowWidth: number = 0;
  private nonBarPosition: number = 0;
  private keyboardController: inputmethodengine.KeyboardController;
  private TextInputClient: inputmethodengine.TextInputClient;
  private InputClient: inputmethodengine.InputClient;
  private capitalizeMode: inputmethodengine.CapitalizeMode;
  private placeholder: string;
  private abilityName: string;

  constructor(context) {
    this.mContext = context;
  }

  public onCreate(): void {
    let that = this;
    inputMethodAbility.on('inputStop', () => {
      this.mContext.destroy((err, data) => {
        console.info(TAG + '====>inputMethodEngine destorey err:' + JSON.stringify(err));
        console.info(TAG + '====>inputMethodEngine destorey data:' + JSON.stringify(data));
      });
    });

    inputMethodEngine.on('inputStart', async (keyboardController, TextInputClient) => {
      this.keyboardController = keyboardController;
      this.TextInputClient = TextInputClient;
      console.info(TAG + '====>inputMethodEngine inputStart into');
    });
    inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
      this.InputClient = InputClient;
      console.info(TAG + '====>inputMethodAbility inputStart into');
    });

    function subscriberCallback(err, data): void {
      console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
      console.info(TAG + '====>receive event data ' + JSON.stringify(data));
      switch (data.code) {
        case 1:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100();
          break;
        case 2:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200();
          break;
        case 3:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100();
          break;
        case 4:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200();
          break;
        case 5:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100();
          break;
        case 6:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200();
          break;
        case 7:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100();
          break;
        case 8:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200();
          break;
        case 9:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100();
          break;
        case 10:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200();
          break;
        case 11:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100();
          break;
        case 12:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200();
          break;
        case 13:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100();
          break;
        case 14:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200();
          break;
        case 15:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100();
          break;
        case 16:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200();
          break;
        case 17:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100();
          break;
        case 18:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200();
          break;
        case 19:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100();
          break;
        case 20:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200();
          break;
        case 21:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100();
          break;
        case 22:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200();
          break;
        case 23:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300();
          break;
        case 24:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100();
          break;
        case 25:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200();
          break;
        case 26:
          console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300();
          break;
        case 27:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200();
          break;
        case 28:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100();
          break;
        case 29:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200();
          break;
        case 30:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100();
          break;
        case 31:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100();
          break;
        case 32:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200();
          break;
        case 33:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100();
          break;
        case 34:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200();
          break;
        case 35:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetForwardCallback_0200();
          break;
        case 36:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetForwardPromise_0100();
          break;
        case 37:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetBackwardCallback_0200();
          break;
        case 38:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetBackwardPromise_0100();
          break;
        case 39:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextCallback_0100();
          break;
        case 40:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextCallback_0200();
          break;
        case 41:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextCallback_0300();
          break;
        case 42:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextPromise_0100();
          break;
        case 43:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextPromise_0200();
          break;
        case 44:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextPromise_0300();
          break;
        case 45:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteForwardSync_0100();
          break;
        case 46:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteForwardSync_0200();
          break;
        case 47:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100();
          break;
        case 48:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200();
          break;
        case 49:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetForwardSync_0100();
          break;
        case 50:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetForwardSync_0200();
          break;
        case 51:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetBackwardSync_0100();
          break;
        case 52:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientgetBackwardSync_0200();
          break;
        case 53:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextSync_0100();
          break;
        case 54:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextSync_0200();
          break;
        case 55:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientinsertTextSync_0300();
          break;
        case 56:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientmoveCursorCallback_0100();
          break;
        case 57:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientmoveCursorPromise_0200();
          break;
        case 58:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientmoveCursorSync_0100();
          break;
        case 59:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientmoveCursorSync_0200();
          break;
        case 60:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByRangeCallback_0200();
          break;
        case 61:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByRangePromise_0100();
          break;
        case 62:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByRangeSync_0100();
          break;
        case 63:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByRangeSync_0200();
          break;
        case 64:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementCallback_0200();
          break;
        case 65:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementPromise_0100();
          break;
        case 66:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementSync_0100();
          break;
        case 67:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementSync_0200();
          break;
        case 68:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelCallback_0100();
          break;
        case 69:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelCallback_0200();
          break;
        case 70:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelCallback_0300();
          break;
        case 71:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0400 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelCallback_0400();
          break;
        case 72:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelPromise_0100();
          break;
        case 73:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelPromise_0200();
          break;
        case 74:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelPromise_0300();
          break;
        case 75:
          console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_createPanelPromise_0400();
          break;
        case 76:
          console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_destroyPanelCallback_0100();
          break;
        case 77:
          console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_destroyPanelCallback_0200();
          break;
        case 78:
          console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_destroyPanelPromise_0100();
          break;
        case 79:
          console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_destroyPanelPromise_0200();
          break;
        case 81:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100();
          break;
        case 82:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200();
          break;
        case 83:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300();
          break;
        case 84:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100();
          break;
        case 85:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementCallback_0300();
          break;
        case 86:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementCallback_0400();
          break;
        case 87:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0500 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementCallback_0500();
          break;
        case 88:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementPromise_0300();
          break;
        case 89:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementPromise_0400();
          break;
        case 90:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0500 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementPromise_0500();
          break;
        case 91:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementSync_0300();
          break;
        case 92:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementSync_0400();
          break;
        case 93:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0500 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientselectByMovementSync_0500();
          break;
        case 94:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100();
          break;
        case 95:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200();
          break;
        case 96:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100();
          break;
        case 97:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200();
          break;
        case 98:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300();
          break;
        case 99:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400();
          break;
        case 100:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100();
          break;
        case 101:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200();
          break;
        case 102:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300();
          break;
        case 103:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400();
          break;
        case 104:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendMessagePromise_0100();
          break;
        case 105:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendMessagePromise_0200();
          break;
        case 106:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendMessagePromise_0300();
          break;
        case 107:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendMessagePromise_0400();
          break;
        case 108:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0500 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientsendMessagePromise_0500();
          break;
        case 109:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0100 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientrecvMessage_0100();
          break;
        case 110:
          console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0200 event:' + data.event);
          that.Sub_InputMethod_IME_InputClientrecvMessage_0200();
          break;
      }
    }

    let commonEventSubscribeInfo = {
      events: ['inputMethodEngineNewTest']
    };

    let subscriber;
    commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
      subscriber = data;
      commoneventmanager.subscribe(subscriber, subscriberCallback);
      console.info(TAG + '====>scene subscribe finish====');
    });
  }

  private publishCallback(err): void {
    if (err) {
      console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
    } else {
      console.log(TAG + '====>publish');
    }
  }

  public onDestroy(): void {
    console.log('imsakitjsapp onDestroy');
    globalThis.textInputClient.getTextIndexAtCursor().then((index) => {
      console.log('imsakitjsapp getTextIndexAtCursor:  index = ' + index);
      prompt.showToast({ message: 'getTextIndexAtCursor success' + index, duration: 200, bottom: 500 });
      let win = windowManager.findWindow(this.windowName);
      win.destroyWindow();
      this.mContext.terminateSelf();
      return true;
    }).catch((err) => {
      prompt.showToast({ message: 'getTextIndexAtCursor failed', duration: 200, bottom: 500 });
    });
  }

  async Sub_InputMethod_IME_InputClientsendMessagePromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMesgId';
      this.InputClient.sendMessage(msgId, null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendMessagePromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendMessagePromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = 'testMesgId';
      this.InputClient.sendMessage(msgId, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendMessagePromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendMessagePromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgId: string = '';
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      this.InputClient.sendMessage(msgId, msgParam);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0300  success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendMessagePromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendMessagePromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      this.InputClient.sendMessage(null, msgParam);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendMessagePromise_0400', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendMessagePromise_0500(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let msgParam: ArrayBuffer = new ArrayBuffer(128);
      this.InputClient.sendMessage(undefined, msgParam);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0500  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendMessagePromise_0500 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendMessagePromise_0500', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientrecvMessage_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.recvMessage(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientrecvMessage_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientrecvMessage_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.recvMessage(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientrecvMessage_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientrecvMessage_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputmethodengine.Range = { start: 0, end: 1 };
      this.InputClient.setPreviewTextSync(null, range);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100 setPreviewTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputmethodengine.Range = { start: 0, end: 1 };
      this.InputClient.setPreviewTextSync(undefined, range);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200 setPreviewTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.setPreviewTextSync('', null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300 setPreviewTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextSync_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.setPreviewTextSync('', undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400 setPreviewTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextSync_0400', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputmethodengine.Range = { start: 0, end: 1 };
      await this.InputClient.setPreviewText(null, range);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let range: inputmethodengine.Range = { start: 0, end: 1 };
      await this.InputClient.setPreviewText(undefined, range);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.setPreviewText('', null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.setPreviewText('', undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsetPreviewTextPromise_0400', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.sendPrivateCommand(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.sendPrivateCommand(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendPrivateCommandPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_createPanelCallback_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1 = {
      type: inputmethodengine.PanelType.STATUS_BAR,
      flag: inputmethodengine.PanelFlag.FLG_FIXED
    };
    try {
      inputMethodAbility.createPanel(null, panelInfo1, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0100  success');
        commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_createPanelCallback_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1 = {
      type: inputmethodengine.PanelType.STATUS_BAR,
      flag: inputmethodengine.PanelFlag.FLAG_CANDIDATE
    };
    try {
      inputMethodAbility.createPanel(undefined, panelInfo1, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0200  success');
        commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_createPanelCallback_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.createPanel(this.mContext, null, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0300  success');
        commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_createPanelCallback_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.createPanel(this.mContext, undefined, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0400  success');
        commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0400', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelCallback_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_createPanelCallback_0400', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_createPanelPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1 = {
      type: inputmethodengine.PanelType.STATUS_BAR,
      flag: inputmethodengine.PanelFlag.FLG_FIXED
    };
    try {
      await inputMethodAbility.createPanel(null, panelInfo1);
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_createPanelPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_createPanelPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let panelInfo1 = {
      type: inputmethodengine.PanelType.STATUS_BAR,
      flag: inputmethodengine.PanelFlag.FLAG_CANDIDATE
    };
    try {
      await inputMethodAbility.createPanel(undefined, panelInfo1);
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_createPanelPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_createPanelPromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await inputMethodAbility.createPanel(this.mContext, null);
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_createPanelPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_createPanelPromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await inputMethodAbility.createPanel(this.mContext, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_createPanelPromise_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_createPanelPromise_0400', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_destroyPanelCallback_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.destroyPanel(null, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0100  success');
        commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_destroyPanelCallback_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      inputMethodAbility.destroyPanel(undefined, async (err, panel) => {
        console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0200  success');
        commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_destroyPanelPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await inputMethodAbility.destroyPanel(null);
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_destroyPanelPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await inputMethodAbility.destroyPanel(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_destroyPanelPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_destroyPanelPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.sendExtendAction(inputmethodengine.ExtendAction.SELECT_ALL, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100 sendExtendAction success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.sendExtendAction(inputmethodengine.ExtendAction.CUT, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200 sendExtendAction success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.sendExtendAction(inputmethodengine.ExtendAction.PASTE, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 sendExtendAction success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.sendExtendAction(inputmethodengine.ExtendAction.CUT);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 sendExtendAction success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendExtendActionPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementCallback_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementCallback_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_UP };
    try {
      this.InputClient.selectByMovement(movement, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0300 selectByMovement success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientselectByMovementCallback_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementCallback_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_LEFT };
    try {
      this.InputClient.selectByMovement(movement, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0400 selectByMovement success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0400', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0400', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientselectByMovementCallback_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementCallback_0500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_RIGHT };
    try {
      this.InputClient.selectByMovement(movement, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0500 selectByMovement success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0500', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0500 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0500', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_InputClientselectByMovementPromise_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_UP };
    try {
      await this.InputClient.selectByMovement(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementPromise_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementPromise_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_LEFT };
    try {
      await this.InputClient.selectByMovement(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0400 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementPromise_0400', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementPromise_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementPromise_0500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_RIGHT };
    try {
      await this.InputClient.selectByMovement(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0500 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0500 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementPromise_0500', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementSync_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementSync_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_UP };
    try {
      this.InputClient.selectByMovementSync(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0300 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementSync_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementSync_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementSync_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_LEFT };
    try {
      this.InputClient.selectByMovementSync(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0400 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InpuSub_InputMethod_IME_InputClientselectByMovementSync_0400tClientselectByMovementPromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementSync_0400', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementSync_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementSync_0500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    let movement = { direction: inputmethodengine.Direction.CURSOR_RIGHT };
    try {
      this.InputClient.selectByMovementSync(movement);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0500 selectByMovement success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0500 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementSync_0500', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.sendKeyFunction(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 sendKeyFunction success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.sendKeyFunction(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 sendKeyFunction success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientsendKeyFunctionCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.sendKeyFunction(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 sendKeyFunction success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.sendKeyFunction(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 Succeed in sendKeyFunction.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientsendKeyFunctionPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.deleteForward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 deleteForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.deleteForward(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 deleteForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteForwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.deleteForward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 deleteForward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.deleteForward(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 Succeed in deleteForward.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteForwardPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.deleteBackward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 deleteBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.deleteBackward(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 deleteBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteBackwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.deleteBackward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 deleteBackward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.deleteBackward(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 Succeed in deleteBackward.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientdeleteBackwardPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.getForward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 getForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetForwardCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.getForward(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 getForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetForwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.getForward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 getForward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetForwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.getForward(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 Succeed in getForward.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetForwardPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.getBackward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 getBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.getBackward(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 getBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetBackwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.getBackward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 getBackward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.getBackward(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 Succeed in getBackward.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientgetBackwardPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.insertText(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 insertText success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.insertText(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 insertText success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.TextInputClient.insertText('', (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 insertText success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300 err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.insertText(null);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 insertText success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.insertText(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 Succeed in insertText.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.TextInputClient.insertText('');
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 Succeed in insertText.');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_TextInputClientinsertTextPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.sendKeyFunction(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 sendKeyFunction success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendKeyFunctionCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.sendKeyFunction(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 sendKeyFunction success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientsendKeyFunctionPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteForward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 deleteForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteForwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.deleteForward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 deleteForward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteForwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteForwardSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteForwardSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 deleteForwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteForwardSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteForwardSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteForwardSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 deleteForwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteForwardSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteForwardSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteBackward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 deleteBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteBackward(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 deleteBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.deleteBackward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 deleteBackward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.deleteBackward(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 Succeed in deleteBackward.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteBackwardSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 deleteBackwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.deleteBackwardSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 deleteBackwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientdeleteBackwardSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetForwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetForwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getForward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 getForward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetForwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetForwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetForwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.getForward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 getForward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetForwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetForwardSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetForwardSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getForwardSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 getForwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetForwardSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetForwardSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetForwardSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getForwardSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 getForwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetForwardSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetForwardSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetBackwardCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getBackward(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 getBackward success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetBackwardCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetBackwardPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.getBackward(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 getBackward success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetBackwardPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetBackwardSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetBackwardSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getBackwardSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 getBackwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetBackwardSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientgetBackwardSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientgetBackwardSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.getBackwardSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 getBackwardSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientgetBackwardSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientgetBackwardSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertText(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 insertText success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertText(undefined, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 insertText success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextCallback_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextCallback_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertText('', (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 insertText success');
        commonEventPublishData = {
          data: 'SUCCESS'
        };
        commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextCallback_0300 err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextCallback_0300', commonEventPublishData, this.publishCallback);
    } 
  }

  async Sub_InputMethod_IME_InputClientinsertTextPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.insertText(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 insertText success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.insertText(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 Succeed in insertText.');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0200 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextPromise_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextPromise_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.insertText('');
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 Succeed in insertText.');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextPromise_0300 err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextPromise_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertTextSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 insertTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertTextSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 insertTextSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientinsertTextSync_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientinsertTextSync_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.insertTextSync('');
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 insertTextSync success');
      commonEventPublishData = {
        data: 'SUCCESS'
      };
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientinsertTextSync_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientinsertTextSync_0300', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientmoveCursorCallback_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.moveCursor(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 moveCursor success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorCallback_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientmoveCursorCallback_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientmoveCursorPromise_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.moveCursor(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 moveCursor success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientmoveCursorPromise_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientmoveCursorSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientmoveCursorSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.moveCursorSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 moveCursorSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientmoveCursorSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientmoveCursorSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientmoveCursorSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.moveCursorSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 moveCursorSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientmoveCursorSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientmoveCursorSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByRangeCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByRange(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 selectByRange success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeCallback_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByRangeCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByRangePromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByRangePromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.selectByRange(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 selectByRange success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangePromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByRangePromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByRangeSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByRangeSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByRangeSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 selectByRangeSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByRangeSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByRangeSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByRangeSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByRangeSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 selectByRangeSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByRangeSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByRangeSync_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementCallback_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByMovement(null, (err, value) => {
        console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 selectByMovement success');
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementCallback_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementCallback_0200', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementPromise_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.InputClient.selectByMovement(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 selectByMovement success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementPromise_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByMovementSync(null);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 selectByMovementSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementSync_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_InputClientselectByMovementSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_InputClientselectByMovementSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.InputClient.selectByMovementSync(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 selectByMovementSync success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_InputClientselectByMovementSync_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_InputClientselectByMovementSync_0200', commonEventPublishData, this.publishCallback);
  }
  
}