//
//  AgreeMentListView.swift
//  DesignSystem
//
//  Created by 서원지 on 3/8/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI

public struct AgreeMentListView: View {
    
    @Binding var checkAgreeButton: Bool
    @Binding var webViewLoading: Bool
    
    var showleft: Bool
    var title: String
    var agreeAllService: Bool
    var essential: TermsEssential
    var confirmAction: () -> Void  = { }
    let safariURL: String
    
    public init(
        checkAgreeButton: Binding<Bool>,
        showleft: Bool,
        title: String,
        agreeAllService: Bool,
        essential: TermsEssential,
        safariURL: String,
        webViewLoading: Binding<Bool>,
        confirmAction: @escaping () -> Void
    ) {
        self._checkAgreeButton = checkAgreeButton
        self.showleft = showleft
        self.title = title
        self.agreeAllService = agreeAllService
        self.essential = essential
        self.safariURL = safariURL
        self._webViewLoading = webViewLoading
        self.confirmAction = confirmAction
    }
    
    
    public var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(agreeAllService ? .basicGray3 : .clear)
            VStack{
                HStack {
                    if agreeAllService {
                        Image(systemName: checkAgreeButton ? "checkmark.circle.fill" : "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(checkAgreeButton ? .lightPurple : .basicGray5)
                            .onTapGesture {
                                confirmAction()
                            }
                    } else {
                        Image(systemName: checkAgreeButton ? "checkmark.circle.fill" : "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(checkAgreeButton ? .lightPurple : .basicGray5)
                            .onTapGesture {
                                checkAgreeButton.toggle()
//                                confirmAction()
                            }
                    }
                    
                    
                    Text(title)
                        .font(.system(size: 16))
                        .foregroundColor(.basicGray9)
                    if !agreeAllService {
                        Text(essential.rawValue)
                            .font(.system(size: 16))
                            .foregroundColor(essential == .essential ? .lightPurple : .basicGray5)
                    }
                    
                    
                    Spacer()
                    
                    if showleft {
                        NavigationLink {
                            WebViews(url: safariURL, loading: $webViewLoading)
                            
                        } label: {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.basicGray5)
                        }
                        
                    } else {
                        Spacer()
                        
                    }
                    
                }
            }
            .onTapGesture {
                if !agreeAllService {
                    checkAgreeButton.toggle()
                } else {
                    confirmAction()
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
        }
        .frame(height: agreeAllService ? 56 : 35)
        .padding(.horizontal, 20)
        .onTapGesture {
            if !agreeAllService {
                    checkAgreeButton.toggle()
            } else {
                confirmAction()
            }
        }
    }
}

public enum TermsEssential: String {
    case essential = "(필수)"
    case choice = "(선택)"
}


