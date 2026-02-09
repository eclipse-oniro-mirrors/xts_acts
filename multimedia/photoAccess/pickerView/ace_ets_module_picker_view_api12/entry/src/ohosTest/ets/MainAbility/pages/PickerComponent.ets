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
  PreselectedInfo,
  UpdatablePickerConfigs,
  MovingPhotoBadgeStateChangedCallback,
  PickerError
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { EventType } from '../common/Common';
import { ClickInfo } from '../common/Common';
import { PhotoPickerResult } from '../common/PhotoPickerResult';

@Entry
@Component
struct PickerComponent {
  @State pickerController: PickerController = new PickerController();
  @State pickerOptions: PickerOptions = new PickerOptions();
  albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
  @State selectedUris: string[] = [];
  @State selectedUrisWithPickerIndex: PreselectedInfo[] = [];
  @State allBackGroundColor: number = 0xf1f3f5;
  @State videoBackGroundColor: number = 0xffffff;
  @State photoBackGroundColor: number = 0xffffff;
  @State isShowAll: boolean = true;
  @State isShowVideo: boolean = false;
  @State isShowPhoto: boolean = false;
  @State isShowAlbum: boolean = false;
  private isBlock: boolean = false;
  private isPickerIndexSet: boolean = false;
  private isOnItemClickedNotifySet: boolean = false;
  @State isPhotoPickerShow: boolean = true;
  @State fontColor: string = '#182431222';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();
  private eventId: number = 0;
  // 控制缩略图是否显示
  @State private isBrowserShow: boolean = false;
  @State vedioCallBackState: VideoPlayerState = 0;

  private selectedItemsDeletedCallback: ItemsDeletedCallback =
    (baseItemInfos: Array<BaseItemInfo>) => this.onSelectedItemsDeleted(baseItemInfos);
  private exceedMaxSeletedCallback: ExceedMaxSelectedCallback =
    (exceedMaxCountType: MaxCountType) => this.onExceedMaxSelected(exceedMaxCountType);
  private currentAlbumDeletedCallback: CurrentAlbumDeletedCallback = () => this.onCurrentAlbumDeleted();
  private videoPlayStateChangedCallback: videoPlayStateChangedCallback =
    (state: VideoPlayerState) => this.onVideoPlayStateChanged(state);
  private onMovingPhotoBadgeStateChangedCallback: MovingPhotoBadgeStateChangedCallback = () => {};

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

  private onItemClickedNotify(itemInfo: ItemInfo, clickType: ClickType): void {
    if (!itemInfo) {
      return;
    }
  
    this.sendEvent({ itemInfo, clickType } as ClickInfo, EventType.ITEM_CLICKED_NOTIFY);
    console.info('onItemClickedNotify' + JSON.stringify(itemInfo));
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
    result.pickerIndex = this.pickerOptions.pickerIndex ?? -1;
    result.preselectedInfos = this.pickerOptions.preselectedInfos ?? [];
    result.isSlidingSupported = this.pickerOptions.isSlidingSupported ?? false;
    result.edgeEffect = this.pickerOptions.edgeEffect ?? EdgeEffect.Spring;
    result.gridPinchMode = this.pickerOptions.gridPinchMode;
    result.autoPlayScenes = this.pickerOptions.autoPlayScenes ?? [];
    result.appAlbumFilters = this.pickerOptions.appAlbumFilters ?? [];
    result.preselectedUris = this.pickerOptions.preselectedUris ?? [];
    return result;
  }

  getUpdatablePickerResult(config: UpdatablePickerConfigs): PhotoPickerResult {
    let result: PhotoPickerResult = new PhotoPickerResult();

    result.maxSelectCount = config.maxSelectNumber ?? 500;
    result.maxPhotoSelectNumber = config.maxPhotoSelectNumber ?? 500;
    result.maxVideoSelectNumber = config.maxVideoSelectNumber ?? 500;
    result.checkBoxColor = config.checkBoxColor ?? '';
    result.checkboxTextColor = config.checkboxTextColor ?? '';
    result.backgroundColor = config.backgroundColor ?? '';
    result.photoBrowserBackgroundColorMode = config.photoBrowserBackgroundColorMode ?? 0;
    result.uiComponentColorMode = config.uiComponentColorMode ?? 0;
    result.isSlidingSupported = config.isSlidingSupported ?? false;
    result.edgeEffect = config.edgeEffect ?? EdgeEffect.Spring;
    result.mimeType = config.mimeType ?? photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
    result.mimeTypeFilter = config.mimeTypeFilter ?? { mimeTypeArray: [] }
    result.isRepeatSelectSupported = config.isRepeatSelectSupported ?? false;
    result.selectMode = config.selectMode ?? 0;
    result.singleSelectionMode = config.singleSelectionMode ?? 2;
    result.preselectedUris = config.preselectedUris ?? [];
    result.autoPlayScenes = config.autoPlayScenes ?? [];
    result.appAlbumFilters = config.appAlbumFilters ?? [];
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

  private onPinchGridSwitched(gridLevel: photoAccessHelper.GridLevel): void {
    console.info('onSelectedItemsDeleted');
    // 捏合图片时的回调
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
    this.vedioCallBackState = state;
  }

  private onScrollStopAtEndCallback(): void {
    console.info('onScrollStopAtEnd')
  }

    private onScrollStopAtStartCallback(): void {
    console.info('onScrollStopAtStart')
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

  private onSelect(uri?: string): void {
    if (uri) {
      this.selectedUris.push(uri);
      if (this.isPickerIndexSet) {
        this.selectedUrisWithPickerIndex.push({
          uri,
          preselectablePickerIndex: this.pickerOptions.pickerIndex
        });
      }
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    this.pickerOptions.preselectedInfos = [...this.selectedUrisWithPickerIndex];
    console.info('onSelect' + JSON.stringify(this.selectedUris));
  }

  private onDeselect(uri?: string): void {
    if (uri) {
      this.selectedUris = this.selectedUris.filter((item: string) => {
        return item !== uri;
      })

      if (this.isPickerIndexSet) {
        this.selectedUrisWithPickerIndex = this.selectedUrisWithPickerIndex.filter((item: PreselectedInfo) => {
          return item.uri !== uri || item.preselectablePickerIndex !== this.pickerOptions.pickerIndex;
        })
      }
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    this.pickerOptions.preselectedInfos = [...this.selectedUrisWithPickerIndex];
    console.info('onDeselect' + JSON.stringify(this.selectedUris));
  }

  private onPhotoBrowserChangeStart(itemInfo: BaseItemInfo): void {
 	  console.info('onPhotoBrowserChangeStart, itemInfo=' + JSON.stringify(itemInfo));
  }

  private onError(pickerError: PickerError): void {
    let functionName = pickerError?.functionName;
    let errorCode = pickerError?.errorCode;
    let message = pickerError?.message;
    console.info(`onError, functionName=${functionName}, errorCode=${errorCode}, message=${message}`);
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
        this.onSelect(uri);
      }
    } else {
      this.onDeselect(uri);
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
      this.isPickerIndexSet = !!this.pickerOptions.pickerIndex && this.pickerOptions.pickerIndex !== -1;
      this.selectedUrisWithPickerIndex = this.pickerOptions.preselectedInfos ?? [];
    }
    if (parameter['isOnItemClickedNotifySet'] != undefined) {
      this.isOnItemClickedNotifySet = parameter['isOnItemClickedNotifySet'];
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
      Button('返回测试结果').width('25%').height('5%').onClick(() => {
        console.info('testPicker setData');
        let result: PhotoPickerResult = this.getPhotoPickerResult();
        this.sendEvent(result, EventType.PHOTO_PICKER_INFO);
      }).id('resultButton')
      Button('UpdatablePickerConfigs').width('25%').height('5%').onClick(() => {
        console.info('update picker options');
        const updatedOptions: UpdatablePickerConfigs = new UpdatablePickerConfigs();
        updatedOptions.maxSelectNumber = 10;
        updatedOptions.maxPhotoSelectNumber = 5;
        updatedOptions.maxVideoSelectNumber = 5;
        updatedOptions.checkBoxColor = '#ff38ff00';
        updatedOptions.checkboxTextColor = '#ffffdc00';
        updatedOptions.backgroundColor = '#f00000';
        updatedOptions.photoBrowserBackgroundColorMode = PickerColorMode.DARK;
        updatedOptions.uiComponentColorMode = PickerColorMode.DARK;
        updatedOptions.isSlidingSupported = true;
        updatedOptions.edgeEffect = EdgeEffect.None;
        updatedOptions.mimeType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
        updatedOptions.mimeTypeFilter = { mimeTypeArray: ['*/*'] }
        updatedOptions.isRepeatSelectSupported = true;
        updatedOptions.selectMode = 0;
        updatedOptions.singleSelectionMode = 2;
        updatedOptions.preselectedUris = ['file:img//sample'];
        updatedOptions.autoPlayScenes = [
          {
            sceneType: photoAccessHelper.SceneType.GRID_TO_PHOTO_BROWSER,
            playMode: photoAccessHelper.PlayMode.AUTO_PLAY,
          },
          {
            sceneType: photoAccessHelper.SceneType.PHOTO_BROWSER_SWIPE,
            playMode: photoAccessHelper.PlayMode.AUTO_PLAY,
          }
        ];
        updatedOptions.appAlbumFilters = 
 	  	           ['com.example.sourceapp.album', 'com.example.sourceapp.album1', 'com.example.sourceapp.album2'];        
        this.pickerController.updatePickerOptions(updatedOptions);

        let result: PhotoPickerResult = this.getUpdatablePickerResult(updatedOptions);
        this.sendEvent(result, EventType.PHOTO_PICKER_INFO);
      }).id('updatePickerOptions')
      Button('选择修改数量').width('25%').height('5%').onClick(() => {
        let maxSelect: MaxSelected = new MaxSelected();
        maxSelect.data = new Map<MaxCountType, number>([[MaxCountType.TOTAL_MAX_COUNT, 1],
          [MaxCountType.PHOTO_MAX_COUNT, 1], [MaxCountType.VIDEO_MAX_COUNT, 1]]);
        this.pickerController.setMaxSelected(maxSelect);
      }).id('changeNumButton')
      Button('退出大图').width('25%').height('5%').onClick(() => {
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
        onItemClickedNotify: this.isOnItemClickedNotifySet
        ? (itemInfo: ItemInfo, clickType: ClickType): void => this.onItemClickedNotify(itemInfo, clickType)
        : undefined,
        onEnterPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onEnterPhotoBrowser(photoBrowserInfo),
        onExitPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onExitPhotoBrowser(photoBrowserInfo),
        onPickerControllerReady: (): void => this.onPickerControllerReady(),
        onSelectedItemsDeleted: this.selectedItemsDeletedCallback,
        onExceedMaxSelected: this.exceedMaxSeletedCallback,
        onCurrentAlbumDeleted: this.currentAlbumDeletedCallback,
        onVideoPlayStateChanged: this.videoPlayStateChangedCallback,
        onScrollStopAtEnd: this.onScrollStopAtEndCallback,
        onScrollStopAtStart: this.onScrollStopAtStartCallback,
        onMovingPhotoBadgeStateChanged: this.onMovingPhotoBadgeStateChangedCallback,
        pickerController: this.pickerController,
        onPinchGridSwitched: (gridLevel: photoAccessHelper.GridLevel): void => this.onPinchGridSwitched(gridLevel),
        onPhotoBrowserChangeStart: (itemInfo: BaseItemInfo): void => this.onPhotoBrowserChangeStart(itemInfo),
 	      onError: (pickerError: PickerError): void => this.onError(pickerError),
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