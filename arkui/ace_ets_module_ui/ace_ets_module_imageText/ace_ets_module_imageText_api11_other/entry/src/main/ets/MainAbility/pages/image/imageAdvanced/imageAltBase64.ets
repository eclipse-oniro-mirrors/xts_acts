/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct imageAltBase64 {
  @State imageLoadingResult: string = 'loading failed';

  build() {
    Row() {
      Column() {
        Text(this.imageLoadingResult)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .id('loadingResultAlt')

        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .alt('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFn'+
            'ZVJlYWR5ccllPAAAAyVpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6'+
            'cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3Jl' +
            'IDYuMC1jMDA2IDc5LjE2NDc1MywgMjAyMS8wMi8xNS0xMTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJod' +
            'HRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdX' +
            'Q9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmF' +
            'kb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZX' +
            'NvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKE1hY2ludG9zaCkiIHhtcE1NOkl' +
            'uc3RhbmNlSUQ9InhtcC5paWQ6ODQxMEIzN0QyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiIHhtcE1NOkRvY3VtZW50SUQ9Inh' +
            'tcC5kaWQ6ODQxMEIzN0UyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFu' +
            'Y2VJRD0ieG1wLmlpZDo4NDEwQjM3QjJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZ' +
            'Do4NDEwQjM3QzJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6e' +
            'G1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjnaUHsAAARqSURBVHjazFlNbFVFFP7u7Xul4ceYtkANBCUYFkQCttUFC8WkpIK' +
            'EgMqqtZgILmRTMLIwwZgYWWCsbGRTSUi1KyT8pAoGE4kLN20KpmICIWk1EmgpBFtLsK/t9Tsz0+a919uZeT/Fd5KZc++8me98M2' +
            '/mnDPvBfg4ghKjEJjnCNtZ72Cp5fNq6gSKLxO010/dy3Kez10z9qe5KJVNEtiMKRylfgGPX7oR4hD15XSSYUaXCAdJ8Kf/iSCUX' +
            'bEvPNIknWQrP/wcpSCaR2smyQj1nMEXKCURPsJrhuQUOlGKYniFZNtAvTbHryP9oM3fGOFFfglWLc6ugSmjLGMsZaZ9kmURy2Jk' +
            'e4iZk4l/5hizxJM4+Ynvq3MSnGAZBqpWAW+8DDz/lG6+egc4/Rtwd4Av1SxJ9RXpTZTSY5Y+wzGbgY01ms+V2xzTB9z704xJOIhG' +
            'qAtwOLrHx8o5CcrM7wLvbAHa6N6fqMjsMjYOHPoOOP4DX6qMUZkUUd9rBI6+xoUrzxwz8gg42AWcuMSXpWaV5yZ6XyDLrStJgi3c' +
            'tV+9Gf+xEPhyFxeOE2r/ng0r9Jh929i+M36MTFTwUiTW8SMbaqwMymUl/5ZxsR9zL1U+yUU57LfLlx8BhhjkljGIDn7oN6bqEy' +
            '7VA7NP42UktCLwoDTV+x/FtyVODRrtKQp/1N4ntLoMbobaGn+D65exqjDaUxS+4/CETu8T+BtMlmmDyTL/MT74ocv1XB30Nz' +
            'g5lal9ROFPpPnVnFeSDvebnvmNfAp/Sb4rCR1Jhv8A9p7xMxgGmdolgiv4MxEr3z0pzvYEHfV+Aj5M2btWL2T1r9EWERzBE1z' +
            'lzB2ScCYFSR1Jjl8Ezl0Hdm/QIS77cEjXzl917Gr7hZ5obPY2S03qUHqK/W71Z4VSa2S2OfP0QyRr/pcOdypGhTETkq/tWZa' +
            'bJrEIZqVewLgJnyvNuzszGkl4nX+TLKxYw5V83b6SF34Gtr5EJ72heCuZcK5gyiQLrwKfMcFYmLSERYa2C2eZPGwCGtbE99nD8i' +
            'lzgQ+6spKSQpy5yoAadRJhIygy/JDVAqMtIjiCJ7iCn78zNwlr9dPMWHZ5ZvtRpnaJ4Aq+2r95k2Tgb67HvEpzMRKMjcv9DZa' +
            'FmdpHFH6hezLK4fIkp1fisNK+97OokD1pEozeO/4G+4ZYPTLaUxR+oQlGZw4Jxslu8UNGe0qnZ4IR2hKM+4wye065jb1L/zg0oC' +
            'OJaHl3ieAKviPBCEMTqKwJhlyW9n6rb3mzrkHjOllov2iShSmt5V3ax2LQBUfw1CXMnWCMB/gousaTtc773r0+j3v3cwXcu4HfhWQ' +
            'HO71Vsr9gBPg6wcpNchpskSlZv8TGGppum2uM7xWD/EJWsjNu5BQmArvLKNoY4UV+oTnjTSX505/hFZpZ9vDpQIkRPKB4ZfnIY2x' +
            '8vyQIah7H4iNOgDa2vAL5FwDe6X0xpVvZFx7WzDzAZXZ8kQS38y6zgyRr6SdXs/3x/49j5D8BBgDvR27YO5AMoAAAAABJRU5ErkJ' +
            'ggg==')
          .onComplete((event)=>{
            this.imageLoadingResult = 'loading success'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}