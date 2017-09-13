# TableView

核心代码

@protocol NVTableViewAdaptorDelegate;

@interface NVTableViewAdaptor : NSObject
<NVTableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NVTableView* uiTableView;
@property (nonatomic, strong) NVIndexPathArray* items;
@property (nonatomic, assign) id<NVTableViewAdaptorDelegate> delegate;
@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) BOOL canMove;


- (NVTableViewCell *) generateCellForObject:(id<NVTableViewCellItemProtocol>)object
                                  indexPath:(NSIndexPath *)indexPath
                                 identifier:(NSString *)identifier;

- (NSString*) tableViewClassName;

- (void)tableViewDidScroll:(UITableView *)tableView;
- (void)tableViewDidEndDragging:(UITableView *)tableView;
- (void)tableViewWillBeginDragging:(UITableView *)tableView;
@end


@protocol NVTableViewAdaptorDelegate <NSObject>

- (void) tableView:(UITableView *)tableView didSelectObject:(id<NVTableViewCellItemProtocol>)object rowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section;
- (BOOL) tableView:(UITableView *)tableView canEditObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL) tableView:(UITableView *)tableView canMoveObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView commitDeletingObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void) tableView:(UITableView *)tableView withObject:(id<NVTableViewCellItemProtocol>)object willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableViewDidScroll:(UITableView *)tableView;
- (void)tableViewWillBeginDragging:(UITableView *)tableView;
- (void)tableViewDidEndDragging:(UITableView *)tableView willDecelerate:(BOOL)decelerate;
- (void)tableViewDidEndDragging:(UITableView *)tableView;
- (void)tableViewwWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
- (void)tableViewWillBeginDecelerating:(UIScrollView *)scrollView;
- (void)tableViewDidEndDecelerating:(UIScrollView *)scrollView  ;
- (void)tableViewScrollBottom:(UITableView*)tableView;

- (CGFloat)tableView:(UITableView *)tableView nvHeightForHeaderInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView nvViewForHeaderInSection:(NSInteger)section;


@end


@interface NVTableViewAdaptor ()
- (NSInteger) numberOfSections;

//获取indexpath位置上cell的数据模型
- (id<NVTableViewCellItemProtocol>) objectForRowAtIndexPath:(NSIndexPath *)indexPath;

//获取cell数据模型item对应的cell的类对象
- (Class) cellClassForObject:(id<NVTableViewCellItemProtocol>)object;

- (NSString*) identifierForCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellTypeAtIndexPath:(NSIndexPath *)indexPath;

@end


@implementation NVTableViewAdaptor

- (id) init {
    self = [super init];
    if (self) {
        self.canMove = NO;
        self.canEdit = NO;
    }
    
    return self;
}

- (NSString*) tableViewClassName {
    return @"NVTableView";
}

- (NVTableViewCell *) generateCellForObject:(id<NVTableViewCellItemProtocol>)object
                                  indexPath:(NSIndexPath *)indexPath
                                 identifier:(NSString *)identifier {
    NVTableViewCell * cell = nil;
    
    if (object) {
        Class cellClass = [self cellClassForObject:object];
        
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setObject:object];
    }
    
    return cell;
}

- (NSInteger) numberOfSections {
    return [_items count];
}

- (CGFloat) heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight       = 0;
    
    UITableView * tableView = _uiTableView;
    id object               = [self objectForRowAtIndexPath:indexPath];
    
    Class cellClass         = [self cellClassForIndexPath:indexPath];
    rowHeight               = [cellClass tableView:tableView rowHeightForObject:object];
    
    return rowHeight;
}

- (id<NVTableViewCellItemProtocol>) objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object   = nil;
    object      = [self.items objectAtIndexPath:indexPath];
    return object;
}

- (Class) cellClassForObject:(id<NVTableViewCellItemProtocol>)object{
    Class cellClass = nil;
    
    if (object) {
        if ([object respondsToSelector:@selector(cellClass)]) {
            cellClass = [object cellClass];
        }
    }
    
    return cellClass;
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = nil;
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    cellClass = [self cellClassForObject:object];
    
    return cellClass;
}

- (NSString *)identifierForCellAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = nil;
    identifier = [self cellTypeAtIndexPath:indexPath];
    
    return identifier;
}

- (NSString *)cellTypeAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellType = nil;
    
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (object) {
        cellType = [object cellType];
    }
    
    return cellType;
}



#pragma mark - UI TableView DataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self numberOfSections];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items countAtSection:section];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    NSString * identifier  = [self identifierForCellAtIndexPath:indexPath];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    if (cell == nil) {
        //初始化cell
        cell = [self generateCellForObject:object indexPath:indexPath identifier:identifier];
    }
    
    //更新数据
    if ([cell isKindOfClass:[NVTableViewCell class]]) {
        [(NVTableViewCell *)cell setObject:object];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height      = 0;
    
    if (_uiTableView == nil) {
        _uiTableView = (NVTableView*)tableView;
    }
    height = [self heightForRowAtIndexPath:indexPath];
    return height;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canEditObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canEditObject:object forRowAtIndexPath:indexPath];
    }
    
    return NO;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canMoveObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canMoveObject:object forRowAtIndexPath:indexPath];
    }
    
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (_delegate && [_delegate respondsToSelector:@selector(tableView:commitDeletingObject:forRowAtIndexPath:)]) {
            [_delegate tableView:tableView commitDeletingObject:object forRowAtIndexPath:indexPath];
        }
    }
}

- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section {
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:enableGroupModeAtSection:)]) {
        return [_delegate tableView:tableView enableGroupModeAtSection:section];
    }
    
    return NO;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:nvHeightForHeaderInSection:)]) {
        return [_delegate tableView:tableView nvHeightForHeaderInSection:section];
    }
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:nvViewForHeaderInSection:)]) {
        return [_delegate tableView:tableView nvViewForHeaderInSection:section];
    }
    return nil;
}


#pragma mark - UI TableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:didSelectObject:rowAtIndexPath:)]) {
        [_delegate tableView:tableView didSelectObject:object rowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id<NVTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:withObject:willDisplayCell:forRowAtIndexPath:)]) {
        [_delegate tableView:tableView withObject:object willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}


#pragma mark - UI ScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if ([self respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
        [self performSelector:@selector(tableViewWillBeginDragging:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
        [_delegate tableViewWillBeginDragging:(UITableView*)scrollView];
    }
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if ([self respondsToSelector:@selector(tableViewDidEndDragging: willDecelerate:)]) {
        [self performSelector:@selector(tableViewDidEndDragging: willDecelerate:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidEndDragging: willDecelerate:)]) {
        [_delegate tableViewDidEndDragging:(UITableView*)scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewwWillEndDragging:withVelocity:targetContentOffset:)]) {
        [_delegate tableViewwWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewWillBeginDecelerating:)]) {
        [_delegate tableViewWillBeginDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidEndDecelerating:)]) {
        [_delegate tableViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    
    if ([self respondsToSelector:@selector(tableViewDidScroll:)]) {
        [self performSelector:@selector(tableViewDidScroll:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidScroll:)]) {
        [_delegate tableViewDidScroll:(UITableView*)scrollView];
    }
    
    CGRect frame = scrollView.frame;
    CGPoint offset = scrollView.contentOffset;
    CGSize size = scrollView.contentSize;
    
    if (size.height <= offset.y + frame.size.height - 30.0f) {
        if (_delegate && [_delegate respondsToSelector:@selector(tableViewScrollBottom:)]) {
            [_delegate tableViewScrollBottom:(UITableView*)scrollView];
        }
    }
}


@end
