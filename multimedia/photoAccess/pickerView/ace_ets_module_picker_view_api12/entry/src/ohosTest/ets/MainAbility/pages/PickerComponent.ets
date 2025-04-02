import {
  PhotoPickerComponent,
  PickerController,
  PickerOptions,
  DataType,
  ItemInfo,
  ItemType,
  PhotoBrowserInfo,
  ClickType,
  PickerColorMode,
  MaxSelected,
  MaxCountType,
  BaseItemInfo,
  PhotoBrowserRange,
  PhotoBrowserUIElement,
  ItemsDeletedCallback,
  ExceedMaxSelectedCallback,
  CurrentAlbumDeletedCallback,
  videoPlayStateChangedCallback,
  VideoPlayerState,
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { EventType } from '../common/Common';
import { PhotoPickerResult } from '../common/PhotoPickerResult';

@Entry
@Component
struct PickerComponent {
  @State pickerController: PickerController = new PickerController();
  @State pickerOptions: PickerOptions = new PickerOptions();
  albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
  @State selectedUris: string[] = [];
  @State allBackGroundColor: number = 0xf1f3f5;
  @State videoBackGroundColor: number = 0xffffff;
  @State photoBackGroundColor: number = 0xffffff;
  @State isShowAll: boolean = true;
  @State isShowVideo: boolean = false;
  @State isShowPhoto: boolean = false;
  @State isShowAlbum: boolean = false;
  private isBlock: boolean = false;
  @State isPhotoPickerShow: boolean = true;
  @State fontColor: string = '#182431222';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();
  private eventId: number = 0;
  // 控制缩略图是否显示
  @State private isBrowserShow: boolean = false;

  private selectedItemsDeletedCallback: ItemsDeletedCallback =
    (baseItemInfos: Array<BaseItemInfo>) => this.onSelectedItemsDeleted(baseItemInfos);
  private exceedMaxSeletedCallback: ExceedMaxSelectedCallback =
    (exceedMaxCountType: MaxCountType) => this.onExceedMaxSelected(exceedMaxCountType);
  private currentAlbumDeletedCallback: CurrentAlbumDeletedCallback = () => this.onCurrentAlbumDeleted();
  private videoPlayStateChangedCallback: videoPlayStateChangedCallback =
    (state: VideoPlayerState) => this.onVideoPlayStateChanged(state);

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

  getPhotoPickerResult(): PhotoPickerResult {
    let result: PhotoPickerResult = new PhotoPickerResult();
    result.checkBoxColor = this.pickerOptions.checkBoxColor ?? '';
    result.backgroundColor = this.pickerOptions.backgroundColor ?? '';
    result.isRepeatSelectSupported = this.pickerOptions.isRepeatSelectSupported ?? false;
    result.photoBrowserBackgroundColorMode = this.pickerOptions.photoBrowserBackgroundColorMode ?? 0;
    result.maxSelectedReminderMode = this.pickerOptions.maxSelectedReminderMode ?? 0;
    result.checkboxTextColor = this.pickerOptions.checkboxTextColor ?? '';
    result.selectMode = this.pickerOptions.selectMode ?? 0;
    result.maxSelectCount = this.pickerOptions.maxSelectNumber ?? 500;
    result.maxPhotoSelectNumber = this.pickerOptions.maxPhotoSelectNumber ?? 500;
    result.maxVideoSelectNumber = this.pickerOptions.maxVideoSelectNumber ?? 500;
    return result;
  }

  private onEnterPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    this.sendEvent(photoBrowserInfo, this.eventId);
    console.info('onEnterPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  private onExitPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    console.info('onExitPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  // 大图页图片切换回调事件处理
  private onPhotoBrowserChanged(photoBrowserItemInfo: BaseItemInfo): boolean{
    console.log('onPhotoBrowserChanged, item = ' + JSON.stringify(photoBrowserItemInfo));
    return true;
  }

  private onPickerControllerReady(): void {
    console.info('onPickerControllerReady');
    let elements: number[] = [PhotoBrowserUIElement.CHECKBOX, PhotoBrowserUIElement.BACK_BUTTON];
    this.pickerController.setPhotoBrowserUIElementVisibility(elements, false);
  }

  private onSelectedItemsDeleted(baseItemInfos: Array<BaseItemInfo>): void {
    console.info('onSelectedItemsDeleted');
    // 已勾选图片被删除时的回调
  }

  private onExceedMaxSelected(exceedMaxCountType: MaxCountType): void {
    console.info('onExceedMaxSelected');
    // 超过最大选择数量再次点击时的回调
  }

  private onCurrentAlbumDeleted(): void {
    console.info('onCurrentAlbumDeleted');
    // 当前相册被删除时的回调
  }

  private onVideoPlayStateChanged(state: VideoPlayerState): void {
    console.info('onVideoPlayStateChanged', state)
    if(state === 3) {
      console.log('state is SEEK_START')
    }
    if(state === 4) {
      console.log('state is SEEK_FINISH')
    }
  }

  private onAlbumClick(albumInfo: AlbumInfo): boolean {
    this.isShowAlbum = false;
    console.info('onAlbumClick' + JSON.stringify(albumInfo?.uri));
    this.sendEvent(albumInfo, EventType.ALBUM_INFO);
    if (albumInfo?.uri) {
      this.pickerController.setData(DataType.SET_ALBUM_URI, albumInfo.uri);
      console.info('onALbumClick' + JSON.stringify(albumInfo.uri));
    }
    return true;
  }

  private onSelect(uri: string): void {
    if (uri) {
      this.selectedUris.push(uri);
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onSelect' + JSON.stringify(this.selectedUris));
  }

  private onDeselect(uri: string): void {
    if (uri) {
      this.selectedUris = this.selectedUris.filter((item: string) => {
        return item !== uri;
      })
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onDeselect' + JSON.stringify(this.selectedUris));
  }

  private onItemClicked(itemInfo: ItemInfo, clickType: ClickType): boolean {
    if (!itemInfo) {
      return false;
    }

    this.sendEvent(itemInfo, EventType.SELECT_ITEM_INFO);
    this.sendEvent(clickType, EventType.SELECT_CLICKTYPE);
    let type: ItemType | undefined = itemInfo.itemType;
    let uri: string | undefined = itemInfo.uri;
    if (type === ItemType.CAMERA) {
      console.info('onCameraClick');
      if (this.isBlock) {
        return false;
      }
    } else if (type === ItemType.THUMBNAIL) {
      if (clickType === ClickType.SELECTED) {
        if (this.isBlock) {
          return false;
        }
        if (uri) {
          this.selectedUris.push(uri);
          this.pickerOptions.preselectedUris = [...this.selectedUris];
        }
      }
    } else {
      if (uri) {
        this.selectedUris = this.selectedUris.filter((item: String) => {
          return item !== uri;
        })
        this.pickerOptions.preselectedUris = [...this.selectedUris];
      }
    }
    console.info('onItemClicked' + JSON.stringify(itemInfo));
    return true;
  }

  aboutToDisappear(): void {
    console.info('testPicker disappear');
  }

  aboutToAppear() {
    let parameter: object = router.getParams();
    if (parameter['eventId'] != undefined) {
      this.eventId = parameter['eventId'];
    }
    if (parameter['pickerOptions'] != undefined) {
      this.pickerOptions = parameter['pickerOptions'];
    }
    if (parameter['albumOptions'] != undefined) {
      this.albumOptions = parameter['albumOptions'];
    }
    console.info('eventId=' + this.eventId);
  }

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  @Builder
  ButtonBar() {
    Row() {
      Button('视频和图片').width('50%').height('5%')
        .onClick(() => {
          this.isShowAll = true;
          this.isShowVideo = false;
          this.isShowPhoto = false;
          this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
        })
      Button('全部相册').width('50%').height('5%')
        .onClick(() => {
          this.isShowAlbum = true;
        }).id('albumButton')
    }.margin({ top: '10vp', bottom: '5vp' })

    Row() {
      Button('返回测试结果').width('33%').height('5%').onClick(() => {
        console.info('testPicker setData');
        let result: PhotoPickerResult = this.getPhotoPickerResult();
        this.sendEvent(result, EventType.PHOTO_PICKER_INFO);
      }).id('resultButton')
      Button('选择修改数量').width('33%').height('5%').onClick(() => {
        let maxSelect: MaxSelected = new MaxSelected();
        maxSelect.data = new Map<MaxCountType, number>([[MaxCountType.TOTAL_MAX_COUNT, 1],
          [MaxCountType.PHOTO_MAX_COUNT, 1], [MaxCountType.VIDEO_MAX_COUNT, 1]]);
        this.pickerController.setMaxSelected(maxSelect);
      }).id('changeNumButton')
      Button('退出大图').width('33%').height('5%').onClick(() => {
        this.pickerController.exitPhotoBrowser();
      }).id('exitBrowser')
    }
  }

  @Builder
  buildPhotoPickerComponent() {
    Stack() {
      PhotoPickerComponent({
        pickerOptions: this.pickerOptions,
        onSelect: (uri: string): void => this.onSelect(uri),
        onDeselect: (uri: string): void => this.onDeselect(uri),
        onItemClicked: (itemInfo: ItemInfo, clickType: ClickType): boolean =>
        this.onItemClicked(itemInfo, clickType),
        onEnterPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onEnterPhotoBrowser(photoBrowserInfo),
        onExitPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onExitPhotoBrowser(photoBrowserInfo),
        onPickerControllerReady: (): void => this.onPickerControllerReady(),
        onSelectedItemsDeleted: this.selectedItemsDeletedCallback,
        onExceedMaxSelected: this.exceedMaxSeletedCallback,
        onCurrentAlbumDeleted: this.currentAlbumDeletedCallback,
        onVideoPlayStateChanged: this.videoPlayStateChangedCallback,
        pickerController: this.pickerController,
      })
        .height('70%')
        .width('100%')
        .visibility(this.isShowAll ? Visibility.Visible : Visibility.Hidden)
        .id('PhotoPickerComponent')
    }
  }

  @Builder
  buildFooter(){
    // 缩略图
    if (this.isBrowserShow) {
      Row() {
        ForEach(this.selectedUris, (uri: string) => {
          Image(uri)
            .height('10%')
            .width('20%')
            .backgroundColor(this.allBackGroundColor)
            .onClick(() => {
              console.log('uri: ' + uri + ' is click');
              this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.ALL);
            })
            .id('smallImage')
        })
      }.offset({
        y: 420
      })
    } else {
      Button('预览')
        .width('33%')
        .height('5vp')
        .onClick(() => {
          if (this.selectedUris.length > 0) {
            this.pickerController.setPhotoBrowserItem(this.selectedUris[0], PhotoBrowserRange.SELECTED_ONLY);
            this.isBrowserShow = true;
          }
        })
        .id('previewButton')
        .offset({
          x: -120,
          y: 400
        })
    }
  }

  @Builder
  buildImage(){
    ForEach(this.selectedUris, (uri: string) => {
      Image(uri).height('10%').width('20%').onClick(() => {
        this.selectedUris = this.selectedUris.filter((item: string) => {
          return uri != item;
        })
        this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
      })
    }, (uri: string) => JSON.stringify(uri))
  }

  @Builder
  buildAlbumPickerComponent() {
    Row() {
      this.buildImage();
    }

    if (this.isShowAlbum) {
      AlbumPickerComponent({
        albumPickerOptions: this.albumOptions,
        onAlbumClick: (albumInfo: AlbumInfo): boolean => this.onAlbumClick(albumInfo),
      }).height('100%').width('100%').id('AlbumPickerComponent')
    }
  }

  build() {
    Stack() {
      Column() {
        this.ButtonBar();
        this.buildPhotoPickerComponent();
        this.buildFooter();
      }

      this.buildAlbumPickerComponent();
    }
  }
}