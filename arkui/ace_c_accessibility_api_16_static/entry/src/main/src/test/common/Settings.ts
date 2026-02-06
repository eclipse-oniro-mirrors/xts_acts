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
import screen from '@ohos.screen';
import window from '@ohos.window';

const TAG: string = '[SettingsCApiDemo]'

class Settings {
  sleep(time) {
    return new Promise((resolve) => {
      setTimeout(resolve, time)
    });
  }

  windowClass: window.Window = null

  //为悬浮窗设置位置
  changeWindowPosition(windowClass, X, Y) {
    windowClass.moveWindowTo(X, Y, (err) => {
      if (err.code) {
        console.error(`${TAG}, Fail to move the window. Cause: ${JSON.stringify(err)}`);
        return;
      }
    })
  }

  //为悬浮窗设置大小
  changeWindowSize(windowClass, width, height) {
    windowClass.resize(width, height, (err) => {
      if (err.code) {
        console.error(`${TAG}, Fail to change the window size. Cause: ${JSON.stringify(err)}`);
        return;
      }
    })
  }

  loadContent(windowClass, pageURI) {
    //为悬浮窗加载对应的目标页面
    windowClass.setUIContent(pageURI, (err) => {
      if (err.code) {
        console.error(`${TAG}, Fail to load the content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info(`${TAG}, Succeeded in loading the content.`);

      //显示悬浮窗
      windowClass.showWindow((err) => {
        if (err.code) {
          console.error(`${TAG}, Fail to show the window. Cause: ${JSON.stringify(err)}`);
          return;
        }
        console.info(`${TAG}, Succeeded in showing the window.`);
      })

    })
  }

  changeDpi(dpi) {
    let screenClass = null;
    screen.getAllScreens((err, data) => {
      if (err.code) {
        console.error(`${TAG}, Fail to get all screens. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info(`${TAG}, Succeeded in geting all screens.`);

      screenClass = data[0];
      //设置设备dpi
      screenClass.setDensityDpi(dpi, (err, data) => {
        if (err.code) {
          console.error(`${TAG}, Fail to set the piexl density. Cause: ${JSON.stringify(err)}`);
          return;
        }
        console.info(`${TAG}, Succeeded in seting the piexl density.`)
      })
    })
  }

  destroyWindow() {
    //销毁窗口
    let windowClass = null;
    try {
      windowClass = window.findWindow('floatWindow');
      console.info(`${TAG}, find window success.`)
    } catch (exception) {
      console.error(`${TAG}, Fail to find the window. Cause: ${JSON.stringify(exception)}`);
    }
    windowClass.destroyWindow((err) => {
      if (err.code) {
        console.error(`${TAG}, Fail to destroy the window. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info(`${TAG}, Succeeded in destroying the window.`)
    })
  }

  createWindow(pageURI: String, {X=0,Y=0,width=1344,height=2560,dpi=400}={}) {
    console.info(`${TAG}, params, pageURI=${pageURI}}, X=${X}, Y=${Y}, width=${width}, height=${height}, dpi=${dpi}`)

    this.changeDpi(dpi);
    this.sleep(1000);
    let windowClass = null;
    let config = {
      name: 'floatWindow', windowType: window.WindowType.TYPE_FLOAT, ctx: globalThis.context
    }
    window.createWindow(config, (err, data) => {
      if (err.code) {
        console.error(`${TAG}, Fail to create the floatWindow. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info(`${TAG}, Succeeded in creating the floatWindow.`)
      windowClass = data;
      this.windowClass = data;

      this.changeWindowPosition(windowClass, X, Y)
      this.changeWindowSize(windowClass, width, height)
      this.loadContent(windowClass, pageURI)
    })
  }
}

export default new Settings()