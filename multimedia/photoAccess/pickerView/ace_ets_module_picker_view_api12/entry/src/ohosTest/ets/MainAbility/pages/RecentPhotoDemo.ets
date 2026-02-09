import { BaseItemInfo } from '@ohos.file.PhotoPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import {
  RecentPhotoOptions,
  PhotoSource,
  RecentPhotoComponent,
  RecentPhotoClickCallback,
  RecentPhotoCheckResultCallback,
  RecentPhotoCheckInfoCallback,
  RecentPhotoInfo,
} from '@ohos.file.RecentPhotoComponent';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { EventType } from '../common/Common';

@Entry
@Component
struct RecentPhotoDemo {
  private recentPhotoOptions: RecentPhotoOptions = new RecentPhotoOptions();
  private recentPhotoClickCallback: RecentPhotoClickCallback =
    (recentPhotoInfo: BaseItemInfo): boolean => this.onRecentPhotoClick(recentPhotoInfo);
  private checkResultCallback: RecentPhotoCheckResultCallback =
    (recentPhotoExists: boolean) => this.onRecentPhotoCheckResult(recentPhotoExists);
  private checkInfoCallback: RecentPhotoCheckInfoCallback = (recentPhotoExists: boolean,
    info: RecentPhotoInfo): void => this.onCheckInfoCallback(recentPhotoExists, info);
  private eventId: number = 0;

  sendEvent(message: Object, eventId: number) {
    let eventData: events_emitter.EventData = {
      data: {
        'msg': message,
      }
    }

    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  aboutToAppear() {
    let parameter: object = router.getParams();
    if (parameter['eventId'] != undefined) {
      this.eventId = parameter['eventId'];
    }
    if (parameter['recentPhotoOptions'] != undefined) {
      this.recentPhotoOptions = parameter['recentPhotoOptions'];
    }
    console.info('eventId=' + this.eventId);
  }

  private onRecentPhotoCheckResult(recentPhotoExists: boolean): void {
    console.info('Check photo, recentPhotoExists = ' + recentPhotoExists);
  }

  private onRecentPhotoClick(recentPhotoInfo: BaseItemInfo): boolean {
    this.sendEvent(recentPhotoInfo, EventType.RECENT_PHOTO_INFO);
    console.info('onRecentPhotoClick  recentPhotoInfo = ' + JSON.stringify(recentPhotoInfo));
    return true;
  }

  private onCheckInfoCallback(recentPhotoExists: boolean, info: RecentPhotoInfo): void {
    console.info('onCheckInfoCallback recentPhotoInfo dateToken ' + info.dateTaken);
    console.info('onCheckInfoCallback recentPhotoInfo identifier ' + info.identifier);
  }

  build() {
    Column() {
      RecentPhotoComponent({
        recentPhotoOptions: this.recentPhotoOptions,
        onRecentPhotoCheckResult: this.checkResultCallback,
        onRecentPhotoClick: this.recentPhotoClickCallback,
        onRecentPhotoCheckInfo: this.checkInfoCallback,
      }).height('50vp').width('50vp').id('recentPhoto')
    }.height('100%').width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}