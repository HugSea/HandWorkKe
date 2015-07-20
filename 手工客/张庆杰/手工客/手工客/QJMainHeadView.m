//
//  QJMainHeadView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJMainHeadView.h"
#import "UIImageView+AFNetworking.h"

@interface QJMainHeadView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation QJMainHeadView

-(void)layoutSubviews {
    [super layoutSubviews];
    
}

-(void)setSlides:(NSArray *)slides {
    _slides = slides;
    self.userInteractionEnabled = YES;
    
    // 图片轮播器
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 0;
    CGFloat scrollViewW = 375;
    CGFloat scrollViewH = 159;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(scrollViewX, scrollViewY, scrollViewW, scrollViewH)];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    CGFloat imageW = scrollView.bounds.size.width;
    CGFloat imageH = scrollView.bounds.size.height;
    for (int i = 0; i < slides.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        [scrollView addSubview:imageView];
        CGFloat imageX = i * imageW;
        CGFloat imageY = 0;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        QJSlide *slide = [QJSlide slideWithDict:slides[i]];
        [imageView setImageWithURL:[NSURL URLWithString:slide.host_pic]];
    }
    scrollView.contentSize = CGSizeMake(scrollViewW * slides.count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    // 增加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.numberOfPages = slides.count;
    CGPoint center = scrollView.center;
    center.y = CGRectGetMaxY(scrollView.frame) - 20;
    pageControl.center = center;
    [pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollAction:) userInfo:nil repeats:YES];
    // 主线程执行优先该定时器
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)scrollAction:(NSTimer *)timer {
    NSInteger currentPage = self.pageControl.currentPage;
    if (currentPage == self.pageControl.numberOfPages - 1) {
        currentPage = 0;
    } else {
        currentPage++;
    }
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * currentPage, 0) animated:YES];
}

// 结束滑动时开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollAction:) userInfo:nil repeats:YES];
    // 主线程执行优先该定时器
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 开始滑动时移除定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

-(void)setNavs:(NSArray *)navs {
    _navs = navs;
    
    CGFloat lineViewY = 0;
    
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width / navs.count;
    CGFloat viewY = CGRectGetMaxY(self.scrollView.frame);
    for (int i = 0; i < navs.count; i++) {
        CGFloat viewX = i * viewW;
        // 自定义View
        UIView *navView = [[UIView alloc] init];
        navView.backgroundColor = [UIColor whiteColor];
        [self addSubview:navView];
        
        // 按钮
        CGFloat margin = 14;
        UIImageView *imageView = [[UIImageView alloc] init];
        QJNav *nav = [QJNav navWithDict:navs[i]];
        [imageView setImageWithURL:[NSURL URLWithString:nav.host_pic]];
        [navView addSubview:imageView];
        CGFloat imageW = viewW - margin * 2;
        CGFloat imageH = imageW;
        CGFloat imageX = margin;
        CGFloat imageY = margin;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        // 文字
        UILabel *lab = [[UILabel alloc] init];
        [navView addSubview:lab];
        lab.text = nav.subject;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:12];
        CGFloat labX = 0;
        CGFloat labY = CGRectGetMaxY(imageView.frame) + margin;
        CGFloat labW = viewW;
        CGFloat labH = 12;
        lab.frame = CGRectMake(labX, labY, labW, labH);
        
        CGFloat viewH = CGRectGetMaxY(lab.frame) + 8;
        navView.frame = CGRectMake(viewX, viewY, viewW, viewH);
        
        lineViewY = CGRectGetMaxY(navView.frame);
    }
    
    // 横线
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, lineViewY, [UIScreen mainScreen].bounds.size.width, 1)];
    self.lineView.alpha = 0.2;
    self.lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.lineView];
}

-(void)setAdvs:(NSArray *)advs {
    _advs = advs;
    
    // 闪购
    UIImageView *buyImageView = [[UIImageView alloc] init];
    [self addSubview:buyImageView];
    QJAdv *adv = [QJAdv advWithDict:advs[0]];
    [buyImageView setImageWithURL:[NSURL URLWithString:adv.ad_img]];
    CGFloat imageX = 0;
    CGFloat imageY = CGRectGetMaxY(self.lineView.frame);
    CGFloat imageW = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat imageH = imageW * 0.5;
    buyImageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 竖线
    CGFloat lineX = CGRectGetMaxX(buyImageView.frame);
    CGFloat lineY = imageY;
    CGFloat lineW = 1;
    CGFloat lineH = imageH;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
    line.backgroundColor = [UIColor blackColor];
    line.alpha = 0.2;
    [self addSubview:line];
    
    // 课堂
    UIImageView *classroomImageView = [[UIImageView alloc] init];
    [self addSubview:classroomImageView];
    adv = [QJAdv advWithDict:advs[1]];
    [classroomImageView setImageWithURL:[NSURL URLWithString:adv.ad_img]];
    classroomImageView.frame = CGRectMake(lineX + 1, lineY, imageW, imageH);
}

#pragma mark - scrollView代理方法

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

@end
