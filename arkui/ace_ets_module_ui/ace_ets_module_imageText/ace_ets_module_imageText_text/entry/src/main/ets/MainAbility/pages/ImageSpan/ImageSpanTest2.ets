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

@Entry
@Component
struct TextImageSpan2 {
  @State flag: string = 'Init'

  build() {
    Column({ space: 100 }) {
      Text(this.flag).id('ImageSpan_onComplete_2')
      Text(){
        ImageSpan('data:image/png;base64,iVBORw0KGgoA'+
        'AAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2'+
        'FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyVpVFh0WE1MOmNvb'+
        'S5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD'+
        '0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGE'+
        'geG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlI'+
        'FhNUCBDb3JlIDYuMC1jMDA2IDc5LjE2NDc1MywgMjAyMS8wMi8xNS0x'+
        'MTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRw'+
        'Oi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gP'+
        'HJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRw'+
        'Oi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDov'+
        'L25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly'+
        '9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcm'+
        'VhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKE1hY2ludG9zaCkiIHhtcE1N'+
        'Okluc3RhbmNlSUQ9InhtcC5paWQ6ODQxMEIzN0QyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0'+
        'NkYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODQxMEIzN0UyRjQ1MTFFRUJFNUNFRT'+
        'AwRjBCQTg0NkYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLm'+
        'lpZDo4NDEwQjM3QjJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIgc3RSZWY6ZG9jdW1lbnRJRD'+
        '0ieG1wLmRpZDo4NDEwQjM3QzJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIvPiA8L3JkZjpEZX'+
        'NjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pj'+
        'naUHsAAARqSURBVHjazFlNbFVFFP7u7Xul4ceYtkANBCUYFkQCttUFC8WkpIKEgMqqtZgILm'+
        'RTMLIwwZgYWWCsbGRTSUi1KyT8pAoGE4kLN20KpmICIWk1EmgpBFtLsK/t9Tsz0+a919uZeT'+
        '/Fd5KZc++8me98M2/mnDPvBfg4ghKjEJjnCNtZ72Cp5fNq6gSKLxO010/dy3Kez10z9qe5KJ'+
        'VNEtiMKRylfgGPX7oR4hD15XSSYUaXCAdJ8Kf/iSCUXbEvPNIknWQrP/wcpSCaR2smyQj1nM'+
        'EXKCURPsJrhuQUOlGKYniFZNtAvTbHryP9oM3fGOFFfglWLc6ugSmjLGMsZaZ9kmURy2Jke4'+
        'iZk4l/5hizxJM4+Ynvq3MSnGAZBqpWAW+8DDz/lG6+egc4/Rtwd4Av1SxJ9RXpTZTSY5Y+wz'+
        'GbgY01ms+V2xzTB9z704xJOIhGqAtwOLrHx8o5CcrM7wLvbAHa6N6fqMjsMjYOHPoOOP4DX6'+
        'qMUZkUUd9rBI6+xoUrzxwz8gg42AWcuMSXpWaV5yZ6XyDLrStJgi3ctV+9Gf+xEPhyFxeOE2'+
        'r/ng0r9Jh929i+M36MTFTwUiTW8SMbaqwMymUl/5ZxsR9zL1U+yUU57LfLlx8BhhjkljGIDn'+
        '7oN6bqEy7VA7NP42UktCLwoDTV+x/FtyVODRrtKQp/1N4ntLoMbobaGn+D65exqjDaUxS+4/'+
        'CETu8T+BtMlmmDyTL/MT74ocv1XB30Nzg5lal9ROFPpPnVnFeSDvebnvmNfAp/Sb4rCR1Jhv'+
        '8A9p7xMxgGmdolgiv4MxEr3z0pzvYEHfV+Aj5M2btWL2T1r9EWERzBE1zlzB2ScCYFSR1Jjl'+
        '8Ezl0Hdm/QIS77cEjXzl917Gr7hZ5obPY2S03qUHqK/W71Z4VSa2S2OfP0QyRr/pcOdypGhT'+
        'ETkq/tWZabJrEIZqVewLgJnyvNuzszGkl4nX+TLKxYw5V83b6SF34Gtr5EJ72heCuZcK5gyi'+
        'QLrwKfMcFYmLSERYa2C2eZPGwCGtbE99nD8ilzgQ+6spKSQpy5yoAadRJhIygy/JDVAqMtIj'+
        'iCJ7iCn78zNwlr9dPMWHZ5ZvtRpnaJ4Aq+2r95k2Tgb67HvEpzMRKMjcv9DZaFmdpHFH6hez'+
        'LK4fIkp1fisNK+97OokD1pEozeO/4G+4ZYPTLaUxR+oQlGZw4Jxslu8UNGe0qnZ4IR2hKM+4'+
        'wye065jb1L/zg0oCOJaHl3ieAKviPBCEMTqKwJhlyW9n6rb3mzrkHjOllov2iShSmt5V3ax2'+
        'LQBUfw1CXMnWCMB/gousaTtc773r0+j3v3cwXcu4HfhWQHO71Vsr9gBPg6wcpNchpskSlZv8'+
        'TGGppum2uM7xWD/EJWsjNu5BQmArvLKNoY4UV+oTnjTSX505/hFZpZ9vDpQIkRPKB4ZfnIY2'+
        'x8vyQIah7H4iNOgDa2vAL5FwDe6X0xpVvZFx7WzDzAZXZ8kQS38y6zgyRr6SdXs/3x/49j5D'+
        '8BBgDvR27YO5AMoAAAAABJRU5ErkJggg==')
          .onError(()=>{
            this.flag = 'onError'
          })
          .onComplete(()=>{
            this.flag = 'onComplete succ'
          })
      }
      .width(200)
      .height(200)
      .borderWidth(1)
    }
  }
}