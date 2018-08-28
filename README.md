# SegmentController

## 段控制器（造轮子）


	// segmentTitiel,暴露出来可以方便二次布局
	@property (nonatomic, strong) XFSegmentBar      *segmentBar;
	// scrollView,暴露出来可以方便二次布局
	@property (nonatomic, strong) UIScrollView      *scrollView;
	// 子控制器，不能为空
	@property (nonatomic, strong, nonnull) NSMutableArray   <UIViewController *> *childVCArray;
	// 选中title颜色
	@property (nonatomic, strong) UIColor       *selectTitleColor;
	// 未选中title颜色
	@property (nonatomic, strong) UIColor       *deselectTitleColor;
	// 选中title字体大小
	@property (nonatomic, strong) UIFont        *selectTitleFont;
	// 未选中title字体大小
	@property (nonatomic, strong) UIFont        *deselectTitleFont;
	// 是否显示title下标线
	@property (nonatomic, assign) BOOL          showTitleLine;
	// 标线是否跟随title改变长度
	@property (nonatomic, assign) BOOL          autoTitleLine;
	// 子控制器是否可滑动切换
	@property (nonatomic, assign) BOOL          canScrollChildVC;
	// 默认选中位置 默认值为 0
	@property (nonatomic, assign) NSUInteger    defaultSelectIndex;
	// segmentBar 高度 默认 35
	@property (nonatomic, assign) double        segmentBarHeight;

	/**
 	初始化 segmentVC

 	@param titles titles
 	@param childVCArray childVCArray
 	*/
	- (void)setSegmentBarWithTitles:( NSArray <NSString *> * _Nonnull )titles childVCArray:(NSArray <UIViewController *> * _Nonnull)childVCArray;

