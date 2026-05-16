/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import { window } from '@kit.ArkUI';

export default class Utils {
  static driver: Driver = Driver.create();
  
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static async pushPage(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success ` + JSON.stringify(pages.name));
        let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        console.info(`push ${pageTag} page success ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async pushPageNoClear(pageTag: string, done?: Function) {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    }
    try {
      await router.pushUrl(options);
    } catch (err) {
      console.error(`push ${pageTag} page error: ` + err);
    }
    if (done) {
      done();
    }
  }

  static async showSubWindow(path: string) {
    // 1.创建应用子窗口。
    if (globalThis.windowStage == null) {
      console.error('Failed to create the subwindow. Cause: globalThis.windowStage is null');
    }
    else {
      globalThis.windowStage.createSubWindow("subWindow", (err: BusinessError, data: window.Window) => {
        let errCode: number = err.code;
        if (errCode) {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          return;
        }
        globalThis.subWindow = data;
        if (!globalThis.subWindow) {
          console.error('globalThis.subWindow is null');
          return;
        }
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        // 2.子窗口创建成功后，设置子窗口的位置、大小及相关属性等。
        globalThis.subWindow.moveWindowTo(300, 300, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to move the window. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in moving the window.');
        });
        globalThis.subWindow.resize(500, 500, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to change the window size. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in changing the window size.');
        });
        // 3.为子窗口加载对应的目标页面。
        globalThis.subWindow.setUIContent(path, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in loading the content.');
          if (!globalThis.subWindow) {
            console.error('globalThis.subWindow is null');
            return;
          }
          // 3.显示子窗口。
          globalThis.subWindow.showWindow((err: BusinessError) => {
            let errCode: number = err.code;
            if (errCode) {
              console.error('Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info('Succeeded in showing the window.');
          });
        });
      })
    }
  }

  static async showSubFloat(path: string) {
    let config: window.Configuration = {
      name: "FloatWindow",
      windowType: window.WindowType.TYPE_FLOAT,
      ctx: globalThis.context,
      defaultDensityEnabled: true
    };
    try {
      window.createWindow(config).then((data:window.Window) => {
        console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
        globalThis.subWindow = data;
        if (!globalThis.subWindow) {
          console.error('globalThis.subWindow is null');
          return;
        }
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        // 2.子窗口创建成功后，设置子窗口的位置、大小及相关属性等。
        globalThis.subWindow.moveWindowTo(300, 300, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to move the window. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in moving the window.');
        });
        globalThis.subWindow.resize(500, 500, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to change the window size. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in changing the window size.');
        });
        // 3.为子窗口加载对应的目标页面。
        globalThis.subWindow.setUIContent(path, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in loading the content.');
          if (!globalThis.subWindow) {
            console.error('globalThis.subWindow is null');
            return;
          }
          // 3.显示子窗口。
          globalThis.subWindow.showWindow((err: BusinessError) => {
            let errCode: number = err.code;
            if (errCode) {
              console.error('Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info('Succeeded in showing the window.');
          });
        });
      }).catch((err:BusinessError)=> {
        console.error(`Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
      });
    } catch (exception) {
      console.error(`Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  static async showSubDialog(path: string) {
    let config: window.Configuration = {
      name: "DialogWindow",
      windowType: window.WindowType.TYPE_DIALOG,
      ctx: globalThis.context,
      defaultDensityEnabled: true
    };
    try {
      window.createWindow(config).then((data:window.Window) => {
        console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
        globalThis.subWindow = data;
        if (!globalThis.subWindow) {
          console.error('globalThis.subWindow is null');
          return;
        }
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        // 2.子窗口创建成功后，设置子窗口的位置、大小及相关属性等。
        globalThis.subWindow.moveWindowTo(300, 300, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to move the window. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in moving the window.');
        });
        globalThis.subWindow.resize(500, 500, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to change the window size. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in changing the window size.');
        });
        // 3.为子窗口加载对应的目标页面。
        globalThis.subWindow.setUIContent(path, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in loading the content.');
          if (!globalThis.subWindow) {
            console.error('globalThis.subWindow is null');
            return;
          }
          // 3.显示子窗口。
          globalThis.subWindow.showWindow((err: BusinessError) => {
            let errCode: number = err.code;
            if (errCode) {
              console.error('Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info('Succeeded in showing the window.');
          });
        });
      }).catch((err:BusinessError)=> {
        console.error(`Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
      });
    } catch (exception) {
      console.error(`Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  static async destroySubWindow() {
    if (!globalThis.subWindow) {
      console.error('globalThis.subWindow is null');
      return;
    }
    // 4.销毁子窗口。当不再需要子窗口时，可根据具体实现逻辑，使用destroy对其进行销毁。
    globalThis.subWindow.destroyWindow((err: BusinessError) => {
      let errCode: number = err.code;
      if (errCode) {
        console.error('Failed to destroy the window. Cause: ' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in destroying the window.');
    });
  }

  static async simulateByShell(cmd: string) {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    return new Promise<string>((resolve, reject) => {
      abilityDelegator.executeShellCommand(cmd, (err, data) => {
        if (err) {
          console.error(`command ${cmd} failed: ${JSON.stringify(err)}`);
          reject("failed");
        } else {
          console.info(`command ${cmd} executed: ${data.stdResult}`);
          resolve("executed");
        }
      });
    })
  }
}
